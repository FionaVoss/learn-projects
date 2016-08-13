require 'rails_helper'

RSpec.feature "Sightings", type: :feature do
  context "creating a sighting" do
    Steps "creating a sighting" do
      Given "i fill in the form to create an animal sighting" do
        visit '/animals/new'
        fill_in "animal_common_name", with: 'tiger'
        fill_in "animal_latin_name", with: 'Panthera tigris'
        fill_in "animal_kingdom", with: 'animalia'
        click_button 'Create Animal'
        visit '/sightings/new'
        fill_in "sighting_latitude", with: "45.5231 N"
        fill_in "sighting_longitude", with: "122.6765 W"
        fill_in "sighting_animal_id", with: Animal.first.id
        click_button "Create Sighting"
      end
      Then "the sighting is submitted to the database" do
        expect(Sighting.first.latitude).to eq "45.5231 N"
        expect(Sighting.first.longitude).to eq "122.6765 W"
        expect(Sighting.first.animal).to eq Animal.first
      end
    end
  end
end
