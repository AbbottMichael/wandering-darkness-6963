require 'rails_helper'

RSpec.describe PlotPlant do
  describe 'relationships' do
    it { should belong_to(:plot) }
    it { should belong_to(:plant) }
  end

  describe 'class methods' do
    before :each do
      @garden1 = Garden.create!(name: 'Garden1', organic: true)
      @plot1 = @garden1.plots.create!(number: 10, size: 'Large', direction: 'East')
      @plant1 = Plant.create!(name: 'Plant1', description: 'Description1', days_to_harvest: 50)
      @plant2 = Plant.create!(name: 'Plant2', description: 'Description2', days_to_harvest: 200)
      @plot_plant1 = PlotPlant.create!(plant_id: @plant1.id, plot_id: @plot1.id)
      @plot_plant2 = PlotPlant.create!(plant_id: @plant2.id, plot_id: @plot1.id)

    end

    it "returns a PlotPlant instance when given a plant_id and a plot_id" do
      expect(PlotPlant.find_plot_plant(@plant1.id, @plot1.id)).to eq(@plot_plant1)
    end
  end
end
