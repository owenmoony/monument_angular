FactoryGirl.define do
  factory :user, aliases: [:owner] do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'secretpassword'
  end

  factory :monument_group, aliases: [:group] do
    owner
    name 'New group'
  end

  factory :monument do
    group
    name 'New monument'
  end

  factory :category do
    owner
    name 'New category'
  end
end
