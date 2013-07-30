# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    name "MyString"
    description "MyText"
    bucket nil
    factory :post_with_url do
      url "http://www.google.com"
    end
  end
end
