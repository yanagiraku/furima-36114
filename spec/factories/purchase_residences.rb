FactoryBot.define do
  factory :purchase_residence do
    postal_code        {"111-1111"}
    delivery_id        {Faker::Number.between(from: 2, to: 48)}
    municipality       {"テスト市"}
    address            {"テスト1丁目1-11"}
    building_name      {"テストビル"}
    phone_number       {"11111111111"}
    token              {"tok_abcdefghijk00000000000000000"}
    user_id            {Faker::Number}
    item_id            {Faker::Number}

  end
end
