FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "email_#{i}@test.com"}
    password "francois" 
    password_confirmation "francois" 
    name "Pseudo_test"
  end
end