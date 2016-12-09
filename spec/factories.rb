FactoryGirl.define do
  factory :user do
    username 'test_user'
    email 'test@example.com'
    password 'test_password'
  end

  factory :listing do
    title 'Listing Title'
    description 'Test description for listing title.'
    user_id 1
  end
end
