require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title)}
    it 'should give an error for more than 255 characters title' do
      str = "a"*256;
      should_not allow_values(str).for(:title)
    end
  end

  describe 'associations' do
    it {should have_many(:ratings).dependent(:destroy) }
    it {should belong_to(:user)}
  end
end
