require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do
  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I fill in the car make and model year' do
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
      end
      And 'I can submit the information' do
        click_button 'Create new car'
      end
      Then "I can see the car's info" do
        expect(page).to have_content('Make: DeLorean')
        expect(page).to have_content('Year: 1985')
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('Speed: 0 mph')
      end
    end # of steps
  end # of context

  context 'Simulating a car' do
    Steps 'Accelerating' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Create new car'
      end
      When 'I click the accelerate button' do
        click_button 'Accelerate'
      end
      Then 'I make it speed up in 10 mph increments' do
        expect(page).to have_content('Make: DeLorean')
        expect(page).to have_content('Year: 1985')
        expect(page).to have_content('Speed: 10 mph')
      end
    end # of steps

    Steps 'Braking' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Create new car'
      end
      And 'and clicked the accelerate' do
        click_button 'Accelerate'
      end
      When 'I click the brake button' do
        click_button 'Brake'
      end
      Then 'I make it slow down in 7 mph increments' do
        expect(page).to have_content('Make: DeLorean')
        expect(page).to have_content('Year: 1985')
        expect(page).to have_content('Speed: 3 mph')
      end
    end # of steps

    Steps 'Braking to zero' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Create new car'
      end
      And 'and clicked the accelerate' do
        click_button 'Accelerate'
      end
      When 'I click the brake button twice' do
        click_button 'Brake'
        click_button 'Brake'
      end
      Then 'I cannot make the speed of the car go below zero' do
        expect(page).to have_content('Make: DeLorean')
        expect(page).to have_content('Year: 1985')
        expect(page).to have_content('Speed: 0 mph')
      end
    end # of steps

    Steps 'Seeing if car lights are on or off' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Create new car'
      end
      Then 'I am taken to a status page that shows that the lights are off' do
        expect(page).to have_content('Lights: Off')
      end

    end # of steps

  end # of context

end # of feature
