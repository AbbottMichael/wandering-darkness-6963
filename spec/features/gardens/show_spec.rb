require 'rails_helper'

RSpec.describe 'The Garden show page' do
  before :each do
    @garden1 = Garden.create!(name: 'Garden1', organic: true)
    @plot1 = @garden1.plots.create!(number: 10, size: 'Large', direction: 'East')
    @plot2 = @garden1.plots.create!(number: 20, size: 'Large', direction: 'West')
    @plant1 = @plot1.plants.create!(name: 'Plant1', description: 'Description1', days_to_harvest: 50)
    @plant2 = @plot1.plants.create!(name: 'Plant2', description: 'Description2', days_to_harvest: 200)
    @plant3 = @plot2.plants.create!(name: 'Plant3', description: 'Description3', days_to_harvest: 50)
    @plant4 = @plot2.plants.create!(name: 'Plant4', description: 'Description4', days_to_harvest: 100)

    visit garden_path(@garden1.id)
  end

  describe "User Story 3, Garden's Plants" do
    it "displays a unique, list all of the plants that are included in the garden's plots, that take less than 100 days to harvest" do
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant3.name)
      expect(page).to_not have_content(@plant2.name)
      expect(page).to_not have_content(@plant4.name)
    end
  end
end
