require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :title => "MyString",
      :street_address_1 => "MyString",
      :street_address_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postal_code => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input#listing_title[name=?]", "listing[title]"

      assert_select "input#listing_street_address_1[name=?]", "listing[street_address_1]"

      assert_select "input#listing_street_address_2[name=?]", "listing[street_address_2]"

      assert_select "input#listing_city[name=?]", "listing[city]"

      assert_select "input#listing_state[name=?]", "listing[state]"

      assert_select "input#listing_postal_code[name=?]", "listing[postal_code]"

      assert_select "input#listing_country[name=?]", "listing[country]"
    end
  end
end
