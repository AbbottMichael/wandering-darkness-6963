require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do
    before :each do
      @garden1 = Garden.create!(name: 'Garden1', organic: true)
      @plot1 = @garden1.plots.create!(number: 10, size: 'Large', direction: 'East')
      @plot2 = @garden1.plots.create!(number: 20, size: 'Large', direction: 'West')
      @plant1 = @plot1.plants.create!(name: 'Plant1', description: 'Description1', days_to_harvest: 50)
      @plant2 = @plot1.plants.create!(name: 'Plant2', description: 'Description2', days_to_harvest: 200)
      @plant3 = @plot2.plants.create!(name: 'Plant3', description: 'Description3', days_to_harvest: 50)
      @plant4 = @plot2.plants.create!(name: 'Plant4', description: 'Description4', days_to_harvest: 100)
    end

    describe '#plant_list_under_100_harvest' do
      it "displays all of the garden's plants with a days to harvest under 100" do
        expect(@garden1.plant_list_under_100_harvest).to eq([@plant1, @plant3])
      end
    end
  end
end
