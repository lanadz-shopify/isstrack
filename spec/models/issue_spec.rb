require 'spec_helper'

describe Issue do
  it { should belong_to :department }
  it { should belong_to :user }
  it { should have_many :history_items }

  describe '#generate_hash' do

    before(:each) do
      Issue.delete_all
    end


    let(:issue1) { FactoryGirl.create :issue}
    let(:issue2) { FactoryGirl.create :issue, department: nil}


    it { issue1.generate_hash.should eq("TES-#{issue1.id.to_s.rjust(6,'0')}") }
    it { issue2.generate_hash.should eq("NON-#{issue2.id.to_s.rjust(6,'0')}") }
  end

end
