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
  it { should belong_to :assignee }

  describe '#new_from' do
    let(:issue) { FactoryGirl.create :issue }
    let(:history_item) { FactoryGirl.build :history_item }

    it "should match" do
      history_item.new_from(issue)
      # [:subject, :status, :assignee].each{ |method| history_item.send(:method).should eq(issue.send(:method)) }
      history_item.subject.should eq(issue.subject)
      history_item.status.should eq(issue.status)
      history_item.assignee.should eq(issue.assignee)
    end
  end
end
