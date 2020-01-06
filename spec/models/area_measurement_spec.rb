require 'rails_helper'

describe AreaMeasurement do
  describe 'associations' do
    it { is_expected.to belong_to :measurable }
  end

  it ".current" do
    area_measurement = create(:area_measurement, created_at: Date.yesterday)
    current = create(:area_measurement, created_at: Date.today)

    expect(described_class.current).to eql(current)
  end
end
