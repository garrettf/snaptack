# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    tack nil
    title "MyString"
    description "MyText"
    number 1
  end
end
