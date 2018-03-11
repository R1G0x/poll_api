require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should_not allow_value("rigo@gmail").for(:email) }
  it { should allow_value("rigo@email.com").for(:email) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:provider) }

  it "should create a new user if uid and provider does not exists" do
    expect{
      User.from_omniauth({uid: "12345", provider: "facebook", info:{email:"rigo@mail.com"}}) 
    }.to change(User, :count).by(1)
  end

  it "should find an user if uid and provider already exists" do
    user = FactoryBot.create(:user)
    expect{
      User.from_omniauth({uid: user.uid, provider: user.provider, info:{email:"rigo@mail.com"}}) 
    }.to change(User, :count).by(0)
  end

  it "should return found user if uid and provider already exists" do
    user = FactoryBot.create(:user)
    expect(
      User.from_omniauth({uid: user.uid, provider: user.provider}) 
    ).to eq(user)
  end
end
