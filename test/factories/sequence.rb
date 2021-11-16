FactoryBot.define do
  sequence :string, aliases: [:name, :first_name, :last_name, :description, :password, :avatar] do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "string#{n}@example.com"
  end

  sequence :expired_at do
    10.days.after.to_date
  end
end
