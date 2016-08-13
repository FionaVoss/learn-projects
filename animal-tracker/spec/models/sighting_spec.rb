require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'Must have a date' do
    expect{Sighting.create!}.to raise_error
    expect{Sighting.create!(:date => DateTime.now)}.not_to raise_error
  end
end
