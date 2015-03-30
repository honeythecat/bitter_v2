FactoryGirl.define do
  factory (:user) do
    email('dog@world.com')
    password('12345678')
  end
end
