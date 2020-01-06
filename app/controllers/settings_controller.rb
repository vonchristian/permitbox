class SettingsController < ApplicationController
  def index
    @classifications = Configurations::Classification.all
  end
end
