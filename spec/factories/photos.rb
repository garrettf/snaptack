# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    title "Example photo"
    description "Example description."
    tack
    sequence(:number)
    image { File.new("#{Rails.root}/spec/fixtures/images/photo.jpg") } 
  end
end
