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
  end

  def to_param
    "#{hash_name}".parameterize
  end

end
