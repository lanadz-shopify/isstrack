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
  belongs_to :issue
  belongs_to :user, foreign_key: :assignee_id

  def create_from(issue)
    self.subject = issue.subject
    self.body = issue.body
    save!
  end


end
