FactoryBot.define do
  factory :comment do
    text { "" }
    user { nil }
    article { nil }
  end
end
