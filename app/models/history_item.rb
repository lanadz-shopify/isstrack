# == Schema Information
#
# Table name: history_items
#
#  id          :integer          not null, primary key
#  issue_id    :integer
#  status      :string(255)      default("waiting_staff")
#  assignee_id :integer
#  subject     :string(255)
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class HistoryItem < ActiveRecord::Base
  attr_accessible :subject, :body, :department_id, :status, :assignee_id, :issue_id

  belongs_to :issue
  belongs_to :assignee, class_name: User, foreign_key: :assignee_id
  after_save :update_issue

  def new_from(issue)
    self.subject = issue.subject
    self.assignee = issue.assignee
    self.status = issue.status
    self
  end

  private

  def update_issue
    self.issue.status = self.status
    self.issue.assignee = self.assignee
    self.issue.save
  end

end
