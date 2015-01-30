require 'spec_helper'

describe User do
  it { should validate_presence_of(:email_address) }
  it { should validate_uniqueness_of(:email_address) }

  it 'should downcase the user email before saving' do
    user = build :user, email_address: "UNCLeUnI@gmail.com"

    user.save

    expect(user.email_address).to eq "uncleuni@gmail.com"
  end
end
