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


    let(:issue1) { FactoryGirl.create :issue }
    let(:issue2) { FactoryGirl.create :issue, department: nil}


    it "with department" do
      issue1.generate_hash
      issue1.hash_name.should eq("TES-#{issue1.id.to_s.rjust(6,'0')}")
    end
    it "without department" do
      issue2.generate_hash
      issue2.hash_name.should eq("NON-#{issue2.id.to_s.rjust(6,'0')}")
    end

  end

end
