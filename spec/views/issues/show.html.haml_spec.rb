require 'spec_helper'

describe "issues/show" do
  before(:each) do
    @issue = assign(:issue, FactoryGirl.create(:issue))
    @history_items = assign(:history_items, FactoryGirl.create_list(:history_item, 3, issue: @issue))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
