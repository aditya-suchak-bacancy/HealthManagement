require 'rails_helper'

RSpec.describe Remind, type: :model do
  let(:remind) { create(:remind)}

  it "is valid with valid attributes" do
    expect(remind).to be_valid
  end
  it "is not valid" do
    remind.remind_date=Date.today-2
    expect(remind).to_not be_valid
  end
end
