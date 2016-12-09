FactoryGirl.define do
  factory :user do
    username 'test_user'
    email 'test@example.com'
    password 'test_password'
  end

  trait :guest do
    username 'Guest'
    password 'GuestPassword'
  end

  factory :listing do
    title 'Listing Title'
    description 'Test description for listing title.'
    user_id 1
  end
end
