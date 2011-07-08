
Factory.define :user do |user|
  user.name                  "Vidhoon Viswanathan"
  user.email                 "vidhoon@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end


Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
