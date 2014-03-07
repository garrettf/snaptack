# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :board do
    name "MyString"
    description "MyText"
    width 1
    height 1
    user nil
  end
end
