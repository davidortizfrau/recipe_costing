require 'spec_helper'

describe "plate_categories/new" do
  before(:each) do
    assign(:plate_category, stub_model(PlateCategory,
      :name => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new plate_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", plate_categories_path, "post" do
      assert_select "input#plate_category_name[name=?]", "plate_category[name]"
      assert_select "input#plate_category_user[name=?]", "plate_category[user]"
    end
  end
end
