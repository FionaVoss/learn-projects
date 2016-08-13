require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        :title => "Title",
        :street_address_1 => "Street Address 1",
        :street_address_2 => "Street Address 2",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :country => "Country"
      ),
      Listing.create!(
        :title => "Title",
        :street_address_1 => "Street Address 1",
        :street_address_2 => "Street Address 2",
        :city => "City",
        :state => "State",
        :postal_code => "Postal Code",
        :country => "Country"
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address 1".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address 2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
