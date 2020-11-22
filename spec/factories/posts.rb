FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph(sentence_count: 5) }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    thumbnail { File.open("#{Rails.root}/spec/fixtures/sample.jpg") }
    association :user

    trait :with_remote_thumbnail do
      thumbnail { nil }
      remote_thumbnail_url { Faker::Avatar.image }
    end
  end
end
