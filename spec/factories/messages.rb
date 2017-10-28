FactoryGirl.define do
  factory :message do
   factory :onlybody do
     body {Faker::Lorem.sentence}
     image ""
     group
     user
    end

    factory :onlyimage do
     body ""
     image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixture/profile.jpg')) }
     group
     user
    end



   factory :all do
     body {Faker::Lorem.sentence}
     image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixture/profile.jpg')) }
     group
     user
   end
  end


end
