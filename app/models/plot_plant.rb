class PlotPlant < ApplicationRecord
  belongs_to :plot
  belongs_to :plant

  def self.find_plot_plant(plant_id, plot_id)
    where(plant_id: plant_id, plot_id: plot_id).take
  end
end
