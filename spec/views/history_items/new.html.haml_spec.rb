require 'spec_helper'

describe "history_items/new" do
  before(:each) do
    assign(:history_item, stub_model(HistoryItem).as_new_record)
  end

  it "renders new history_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", history_items_path, "post" do
    end
  end
end
