FactoryBot.define do
  factory :token do
    expires_at "2018-03-10 17:49:14"
    association :user, factory: :user
  end
end
