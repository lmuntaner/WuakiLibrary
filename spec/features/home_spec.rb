require 'rails_helper'

RSpec.describe "Home", type: :feature, js: true do

  describe "visit home page" do
    before do
      # @user = User.create!(
      #   username: 'sheldon',
      #   email: 'sheldon@awesome.com',
      #   password: '1234',
      #   password_confirmation: '1234'
      # )
      item = Item.create!(title: 'Trainspotting', category: 'Movie')
      second_item = Item.create!(title: 'Fight Club', category: 'Movie')
    end

    it "should have proper title" do
      @user = User.create!(
        username: 'sheldon',
        email: 'sheldon@awesome.com',
        password: '1234',
        password_confirmation: '1234'
      )
      visit root_path
      expect(page).to have_content('All The Movies')
    end
  end
end
