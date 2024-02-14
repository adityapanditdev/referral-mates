FactoryBot.define do
  factory :invitation, class: Invitation do
    referred_by { 1 }
    email { Faker::Internet.email }
  end
end
