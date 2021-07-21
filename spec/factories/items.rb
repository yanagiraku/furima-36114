FactoryBot.define do
  factory :item do
    item_name             {Faker::Name.initials}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    item_description      {Faker::Lorem.sentence}
    status_id             {Faker::Number.between(from: 2, to: 7)}
    burden_id             {Faker::Number.between(from: 2, to: 3)}
    delivery_id           {Faker::Number.between(from: 2, to: 48)}
    day_delivery_id       {Faker::Number.between(from: 2, to: 4)}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
   
    association :user
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
