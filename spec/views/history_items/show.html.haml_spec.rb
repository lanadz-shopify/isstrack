require 'spec_helper'

describe "history_items/show" do
  before(:each) do
    @history_item = assign(:history_item, stub_model(HistoryItem))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
