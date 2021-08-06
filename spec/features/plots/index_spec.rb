require 'rails_helper'

RSpec.describe 'The Plot index page' do
  before :each do
    @garden1 = Garden.create!(name: 'Garden1', organic: true)
    @plot1 = @garden1.plots.create!(number: 10, size: 'Large', direction: 'East')
    @plot2 = @garden1.plots.create!(number: 20, size: 'Large', direction: 'West')
    @plant1 = @plot1.plants.create!(name: 'Plant1', description: 'Description1', days_to_harvest: 50)
    @plant2 = @plot1.plants.create!(name: 'Plant2', description: 'Description2', days_to_harvest: 200)
    @plant3 = @plot2.plants.create!(name: 'Plant3', description: 'Description3', days_to_harvest: 50)
    @plant4 = @plot2.plants.create!(name: 'Plant4', description: 'Description4', days_to_harvest: 100)

    visit '/plots'
  end

  describe 'User story 1, Plots Index Page' do
    it "displays a list of all plot numbers" do
      expect(page).to have_content(@plot1.number)
      expect(page).to have_content(@plot2.number)
    end

    it "displays the names of all of that plot's plants under it's plot number"
  end
end
