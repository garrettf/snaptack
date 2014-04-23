# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tack do
    name "Example Tack"
    description "Example description."
    top 1
    left 1
    board
  end
end
