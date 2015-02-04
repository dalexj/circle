FactoryGirl.define do
  factory :user do
    name 'Uncle Uni'
    admin false
    owner false
    password 'password'
    email_address 'uncleuni@gmail.com'
  end

  factory :admin, class: User do
    name 'Ally Acker'
    admin true
    owner false
    password 'password'
    email_address 'allyacker@gmail.com'
  end

  factory :owner, class: User do
    name 'Owen Oyster'
    admin false
    owner true
    password 'password'
    email_address 'owneoyster@gmail.com'
  end

  factory :candidate, class: User do
    name 'Charles'
    admin false
    owner false
    candidate true
    password 'password'
    email_address 'charles@gmail.com'
  end
end
