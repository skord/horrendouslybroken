FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.paragraphs(1).first }
    post nil
    user nil
  end
end
