require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'Must have a common name' do
    expect{Animal.create!}.to raise_error
    expect{Animal.create!(:common_name => 'tiger')}.not_to raise_error
  end
end
