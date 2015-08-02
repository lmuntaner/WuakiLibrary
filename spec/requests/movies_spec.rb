require 'rails_helper'

RSpec.describe "Movies", type: :request do

  describe "GET /api/movies" do
    before do
      @movie = Item.create!(title: 'Trainspotting', category: 'Movie')
      @second_movie = Item.create!(title: 'Fight Club', category: 'Movie')
    end

    it "returns all the movies" do
      get api_movies_path(format: :json)
      data = JSON.parse(response.body)

      expect(data.size).to eq(2)
    end

    it "returns the movies ordered by creation date" do
      get api_movies_path(format: :json)
      data = JSON.parse(response.body)

      expect(data.first['title']).to eq('Fight Club')
    end
  end
end
