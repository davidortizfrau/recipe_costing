require 'spec_helper'

describe "plate_categories/index" do
  before(:each) do
    assign(:plate_categories, [
      stub_model(PlateCategory,
        :name => "Name",
        :user => nil
      ),
      stub_model(PlateCategory,
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of plate_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
