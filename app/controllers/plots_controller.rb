class PlotsController < ApplicationController
  def index
    @plots = Plot.all
    @plot_path = PlotPlant.all
  end
end
