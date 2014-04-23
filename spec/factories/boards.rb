# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :board do
    name 'Example Board'
    description 'Example description.'
    image { File.new("#{Rails.root}/spec/fixtures/images/board.jpg") } 
    user nil
  end
end
