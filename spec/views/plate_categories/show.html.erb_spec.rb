require 'spec_helper'

describe "plate_categories/show" do
  before(:each) do
    @plate_category = assign(:plate_category, stub_model(PlateCategory,
      :name => "Name",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end
