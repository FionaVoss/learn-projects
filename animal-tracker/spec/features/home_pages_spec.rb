require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  context "visiting the home page" do
    Steps "visting the home page" do
      Given "I visit the home page" do
        visit '/'
      end
      Then "I see a welcome message" do
        expect(page).to have_content "Welcome to the Animal Tracker"
      end
    end
  end
end
