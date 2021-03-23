require 'rails_helper'

RSpec.describe BloodPressureDetail, type: :model do
  let(:blood_pressure_detail) { create(:blood_pressure_detail)}

  it "is valid with valid attributes" do
    expect(blood_pressure_detail).to be_valid
  end
  it "is not valid" do
    blood_pressure_detail.blood_pressure_date=Date.today+1
    expect(blood_pressure_detail).to_not be_valid
  end

end
