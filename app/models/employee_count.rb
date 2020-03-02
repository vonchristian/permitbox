class EmployeeCount < ApplicationRecord
  belongs_to :business
  belongs_to :locality, class_name: "Locations::Locality"
  before_save :set_default_date 
  def self.recent
    order(date: :asc).first
  end

  private 
  
  def set_default_date
    todays_date = ActiveRecord::Base.default_timezone == :utc ? Time.now.utc : Time.now
    self.date ||= todays_date
  end

end
