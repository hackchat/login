Fabricator(:user) do
  first_name { Faker::Name.first_name }
  last_name  { Faker::Name.last_name }
  email { Faker::Internet.email(Faker::Company.name) }
  password "hungry"
  password_confirmation "hungry"
end