class Garden < ApplicationRecord
  has_many :plots

  def plant_list_under_100_harvest
    Plant.joins(plots: :plot_plants)
             .where('garden_id = ?', self.id)
             .where('days_to_harvest < ?', 100).distinct
  end
end
