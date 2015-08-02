require 'rails_helper'

RSpec.describe "Library App", type: :feature, js: true do
  before do
    @user = User.create!(
      username: 'sheldon',
      email: 'sheldon@awesome.com',
      password: '1234',
      password_confirmation: '1234'
    )
    item = Item.create!(title: 'Trainspotting', category: 'Movie')
    second_item = Item.create!(title: 'Fight Club', category: 'Movie')
  end

  describe "visit home page" do
    it "should have proper title" do
      p @user
      p User.first
      visit root_path
      expect(page).to have_content('All The Movies')
    end
  end

  describe 'user library page' do
    it "should have proper title" do
      p @user
      p User.first
      visit '/#/my_library'
      expect(page).to have_content('My Library')
    end
  end
end
