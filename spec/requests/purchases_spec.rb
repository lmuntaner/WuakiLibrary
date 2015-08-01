require 'rails_helper'

RSpec.describe "Purchases", type: :request do

  describe "POST /api/purchases" do
    before do
      @user = User.create!(
        username: 'sheldon',
        email: 'sheldon@awesome.com',
        password: '1234',
        password_confirmation: '1234')
      item = Item.create!(title: 'Trainspotting', category: 'Movie')
      second_item = Item.create!(title: 'Fight Club', category: 'Movie')
      @not_purchased_option = item.purchase_options.create!(quality: 'HD', price: 2.99)
      @purchased_option = second_item.purchase_options.create!(quality: 'SD', price: 2.99)
      @user.purchases.create(purchase_option_id: @purchased_option.id)
    end

    it "allows the purchasing of an item" do
      post api_purchases_path(format: :json), { purchase_option_id: @not_purchased_option.id }
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data['purchase']['title']).to eq('Trainspotting')
    end

    it "doesn't allow the purchasing of the same item twice" do
      post api_purchases_path(format: :json), { purchase_option_id: @purchased_option.id }
      data = JSON.parse(response.body)

      expect(response).to have_http_status(422)
      expect(data['errors']['item'].first).to eq('already purchased')
    end
  end
end
