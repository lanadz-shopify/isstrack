class Issue < ActiveRecord::Base
  STATUSES = %w[waiting_customer on_hold canceled completed]

  attr_accessible :subject, :body, :customer_email, :customer_name
  attr_accessible :assignee, :status, as: :admin

  belongs_to :department
  belongs_to :user, foreign_key: :assignee_id
  has_many :history_items


end
