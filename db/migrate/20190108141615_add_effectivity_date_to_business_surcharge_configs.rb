class AddEffectivityDateToBusinessSurchargeConfigs < ActiveRecord::Migration[5.2]
  def change
    add_column :business_surcharge_configs, :effectivity_date, :datetime
  end
end
