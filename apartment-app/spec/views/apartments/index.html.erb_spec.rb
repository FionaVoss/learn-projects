require 'rails_helper'

RSpec.describe "apartments/index", type: :view do
  before(:each) do
    assign(:apartments, [
      Apartment.create!(
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip_code => "Zip Code",
        :contact_name => "Contact Name",
        :contact_email => "Contact Email",
        :latitude => 1.5,
        :longitude => 1.5
      ),
      Apartment.create!(
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip_code => "Zip Code",
        :contact_name => "Contact Name",
        :contact_email => "Contact Email",
        :latitude => 1.5,
        :longitude => 1.5
      )
    ])
  end

  it "renders a list of apartments" do
    render
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
