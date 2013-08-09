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

require 'spec_helper'

describe HistoryItem do
  it { should belong_to :issue }
  it { should belong_to :user }
end
