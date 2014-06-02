require 'spec_helper'

describe "plate_categories/edit" do
  before(:each) do
    @plate_category = assign(:plate_category, stub_model(PlateCategory,
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit plate_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", plate_category_path(@plate_category), "post" do
      assert_select "input#plate_category_name[name=?]", "plate_category[name]"
      assert_select "input#plate_category_user[name=?]", "plate_category[user]"
    end
  end
end
