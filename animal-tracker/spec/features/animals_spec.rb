require 'rails_helper'

RSpec.feature "Animals", type: :feature do
  context 'Creating an animal' do
    Steps 'Creating an animal' do
      Given 'I fill out the form on the create new animal page' do
        visit '/animals/new'
        fill_in "animal_common_name", with: 'tiger'
        fill_in "animal_latin_name", with: 'Panthera tigris'
        fill_in "animal_kingdom", with: 'animalia'
        click_button 'Create Animal'
      end
      Then 'The animal information will be in the database' do
        expect(Animal.first.common_name).to eq 'tiger'
        expect(Animal.first.latin_name).to eq 'Panthera tigris'
        expect(Animal.first.kingdom).to eq 'animalia'
      end
    end
  end
end
