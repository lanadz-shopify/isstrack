class HistoryItem < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user, foreign_key: :assignee_id

end
