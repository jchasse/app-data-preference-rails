# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
  :user_keys =>
    ["first_name", "last_name", "email", "mobile_number", "password"],
  :users => [
    ["Max", "Charles", "max@test.com", "123-456-7890", "max"],
    ["Skai", "Johnson", "skai@test.com", "123-456-7890", "skai"],
    ["Kaleo", "Elam", "kaleo@test.com", "123-456-7890", "kaleo"],
    ["Megan", "Carpenter", "megan@test.com", "123-456-7890", "megan"],
    ["Davis", "Cleveland", "davis@test.com", "123-456-7890", "davis"]
  ],
  :account_keys =>
   ["org_name", "website", "toll_free_number"],
  :accounts => [
    ["Google", "www.google.com", "1-800-123-4567"],
    ["Facebook", "www.facebook.com", "1-800-123-4567"],
    ["Apple", "www.apple.com", "1-800-123-4567"],
    ["Netflix", "www.netflix.com", "1-800-123-4567"],
    ["Amazon", "www.amazon.com", "1-800-123-4567"]
  ],
  :admins => [
    "jon@test.com",
    "admin@test.com"
  ]
}

def main
  make_users
#   make_admin
#   make_accounts_and_digitalprints
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

# def make_admin
#   DATA[:admins].each do |email|
#     User.create(email: email, admin: true, password: 'password')
#   end
# end

# def make_accounts_and_digitalprints
#   DATA[:accounts].each do |account|
#     new_account = Account.new
#     account.each_with_index do |attribute, i|
#       new_account.send(DATA[:account_keys][i] + "=", attribute)
#     end
#     rand(1..8).times do
#       customers = []
#       User.all.each {|u| customers << u if u.admin != true}
#       new_account.users << customers[rand(0...customers.length)]
#     end
#     new_account.users.each {|c| c.save}
#     new_account.save
#   end
# end

main
