# == Schema Information
#
# Table name: issues
#
#  id             :integer          not null, primary key
#  department_id  :integer
#  customer_email :string(255)
#  customer_name  :string(255)
#  status         :string(255)      default("waiting_staff")
#  assignee_id    :integer
#  subject        :string(255)
#  body           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  hash_name      :string(255)
#

class Issue < ActiveRecord::Base
  STATUSES = %w[waiting_staff waiting_customer on_hold canceled completed]
  VIEWS = %w[all unassigned opened on_hold closed]

  scope :unassigned, -> { where(assignee_id: nil)}
  scope :opened, -> { where('status = "waiting_staff" OR status = "waiting_customer"')}
  scope :on_hold, -> { where(status: :on_hold)}
  scope :closed, -> { where('status = "canceled" or status = "completed"')}

  attr_accessible :subject, :body, :customer_email, :customer_name, :department_id

  belongs_to :department
  belongs_to :assignee, class_name: User, foreign_key: :assignee_id
  has_many :history_items

  validates_presence_of :subject, :body, :customer_email, :customer_name

  after_create :generate_hash, :send_mail_issue_created
  before_save :send_mail_status_changed


  def to_param
    "#{hash_name}".parameterize
  end

  private

  def send_mail_status_changed
    IssueMailer.status_changed(self).deliver unless self.new_record?
  end

  def send_mail_issue_created
    IssueMailer.new_issue_arrived(self).deliver
  end

  def generate_hash
    hash_name = self.department.blank? ? "NON-#{self.id.to_s.rjust(6,'0')}" : "#{self.department.title[0..2].upcase}-#{self.id.to_s.rjust(6,'0')}"
    self.update_column(:hash_name, hash_name) # update not trigger callback before_save
  end

end
