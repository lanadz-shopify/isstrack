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

require 'spec_helper'

describe Issue do
  it { should belong_to :department }
  it { should belong_to :assignee }
  it { should have_many :history_items }

  describe '#generate_hash' do
    context "with department" do
      let(:issue) { FactoryGirl.create :issue }
      before { issue.generate_hash }

      it{ issue.hash_name.should eq("TES-#{issue.id.to_s.rjust(6,'0')}") }
    end

    context "without department" do
      let(:issue) { FactoryGirl.create :issue, department: nil }
      before { issue.generate_hash }

      it{ issue.hash_name.should eq("NON-#{issue.id.to_s.rjust(6,'0')}") }
    end
  end

end
