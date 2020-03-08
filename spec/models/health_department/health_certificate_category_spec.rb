require 'rails_helper'

module HealthDepartment
  describe HealthCertificateCategory do
    describe 'associations' do 
      it { is_expected.to validate_presence_of :title }
      it "is_expected.to validate_uniqueness_of :title " do 
        create(:health_certificate_category, title: "Food")
        categery_1 = build(:health_certificate_category, title: "Food")
        categery_1.save 
        
        expect(categery_1.errors[:title]).to eql ["has already been taken"]
      end 
    end 
  end 
end
