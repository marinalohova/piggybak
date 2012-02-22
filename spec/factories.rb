FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email){|n| "user#{n}@factory.com" }
    u.password "password"
    u.password_confirmation "password"

  end

  factory :variant do
  end

  factory :country, :class => Piggybak::Country do |c|
   c.name "United States"
   c.abbr "USA"
  end

  factory :state, :class => Piggybak::State do |c|
   c.name "Michigan"
   c.abbr "MI"
   c.association :country
  end

  factory :billing_address, :class => Piggybak::Address do |b|
     b.firstname "test"
     b.lastname "test"
     b.city "Los Angeles"
     b.association :state
     b.association :country
     b.address1 "Test Ave"
     b.zip "90000"
  end

  factory :shipping_address, :class => Piggybak::Address do |b|
     b.firstname "test"
     b.lastname "test"
     b.city "Los Angeles"
     b.association :state
     b.association :country
     b.address1 "Test Ave"
     b.zip "90000"
  end

  factory :order, :class => Piggybak::Order do |o|
    o.association :user
    o.association :billing_address
    o.association :shipping_address
    o.sequence(:email){|n| "user#{n}@factory.com" }
    o.phone "111111111111"
  end

  factory :line_item, :class => Piggybak::LineItem do |i|
    i.quantity 10
  end

  factory :shipment do
  end

  factory :payment do
  end
end
