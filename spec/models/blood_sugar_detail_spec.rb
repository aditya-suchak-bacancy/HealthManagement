require 'rails_helper'

RSpec.describe BloodSugarDetail, type: :model do
  let(:blood_sugar_detail) { create(:blood_sugar_detail)}

  it "is valid with valid attributes" do
    expect(blood_sugar_detail).to be_valid
  end
  it "is not valid" do
    blood_sugar_detail.blood_sugar_date=Date.today+1
    expect(blood_sugar_detail).to_not be_valid
  end
end
