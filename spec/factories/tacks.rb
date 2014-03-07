# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tack do
    name "MyString"
    description "MyText"
    top 1
    left 1
    board nil
  end
end
