require 'rails_helper'

RSpec.describe "apartments/new", type: :view do
  before(:each) do
    assign(:apartment, Apartment.new(
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString",
      :contact_name => "MyString",
      :contact_email => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new apartment form" do
    render

    assert_select "form[action=?][method=?]", apartments_path, "post" do

      assert_select "input#apartment_street_address[name=?]", "apartment[street_address]"

      assert_select "input#apartment_city[name=?]", "apartment[city]"

      assert_select "input#apartment_state[name=?]", "apartment[state]"

      assert_select "input#apartment_zip_code[name=?]", "apartment[zip_code]"

      assert_select "input#apartment_contact_name[name=?]", "apartment[contact_name]"

      assert_select "input#apartment_contact_email[name=?]", "apartment[contact_email]"

      assert_select "input#apartment_latitude[name=?]", "apartment[latitude]"

      assert_select "input#apartment_longitude[name=?]", "apartment[longitude]"
    end
  end
end
