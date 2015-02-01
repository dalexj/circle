require 'spec_helper'

describe User do
  it { should have_secure_password }
  it { should validate_presence_of(:email_address) }
  it { should validate_uniqueness_of(:email_address) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:inner_circles) }
  it { should have_and_belong_to_many(:followers) }
  it { should have_and_belong_to_many(:owners) }

  it 'should downcase the user email before saving' do
    user = build :user, email_address: "UNCLeUnI@gmail.com"

    user.save

    expect(user.email_address).to eq "uncleuni@gmail.com"
  end
end

describe User, '#candidates' do
  it 'should be able to have followers that are also candidates' do
    owner = create :owner
    candidate = create :candidate

    owner.followers << candidate

    expect(owner.candidates).to eq [candidate]
  end

  it 'should be able to have followers that are not candidates' do
    owner = create :owner
    user = create :user

    owner.followers << user

    expect(owner.candidates).to be_empty
    expect(owner.followers).to eq [user]
  end
end

