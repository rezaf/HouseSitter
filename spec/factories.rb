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
    title { generate(:title) }
    description 'Test description for listing titles.'
    user_id { User.first.id }
  end

  sequence :title do |n|
    "Listing Title #{n}"
  end
end
