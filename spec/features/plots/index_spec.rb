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

    visit plots_path
  end

  describe 'User story 1, Plots Index Page' do
    it "displays a list of all plot numbers" do
      expect(page).to have_content(@plot1.number)
      expect(page).to have_content(@plot2.number)
    end

    it "displays the names of all of that plot's plants under it's plot number" do
      within "#plot-#{@plot1.id}" do
        expect(page).to have_content(@plant1.name)
        expect(page).to have_content(@plant2.name)
        expect(page).to_not have_content(@plant3.name)
        expect(page).to_not have_content(@plant4.name)
      end
      within "#plot-#{@plot2.id}" do
        expect(page).to have_content(@plant3.name)
        expect(page).to have_content(@plant4.name)
        expect(page).to_not have_content(@plant1.name)
        expect(page).to_not have_content(@plant2.name)
      end
    end
  end

  describe 'User Story 2, Remove a Plant from a Plot' do
    it "displays, next to each plant's name, a link to remove the plant" do
      within "#plot-#{@plot1.id}" do
        expect(page).to have_link("Remove #{@plant1.name}")
        expect(page).to have_link("Remove #{@plant2.name}")
        expect(page).to_not have_link("Remove #{@plant3.name}")
        expect(page).to_not have_link("Remove #{@plant4.name}")
      end
      within "#plot-#{@plot2.id}" do
        expect(page).to have_link("Remove #{@plant3.name}")
        expect(page).to have_link("Remove #{@plant4.name}")
        expect(page).to_not have_link("Remove #{@plant1.name}")
        expect(page).to_not have_link("Remove #{@plant2.name}")
      end
    end
  end
end
