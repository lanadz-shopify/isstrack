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
  STATUSES = %w[waiting_staff on_hold canceled completed]

  attr_accessible :subject, :body, :customer_email, :customer_name, :department_id
  attr_accessible :assignee, :status, as: :admin

  belongs_to :department
  belongs_to :user, foreign_key: :assignee_id
  has_many :history_items

  validates_presence_of :subject, :body, :customer_email, :customer_name

  def generate_hash
    self.hash_name = self.department.blank? ? "NON-#{self.id.to_s.rjust(6,'0')}" : "#{self.department.title[0..2].upcase}-#{self.id.to_s.rjust(6,'0')}"
    save!
  end

  def to_param
    "#{hash_name}".parameterize
  end

end
