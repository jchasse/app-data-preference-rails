# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(first_name: "Max", last_name: "Charles", email: "max@test.com", mobile_number: "123-456-7890", password: "max")
@account = Account.create(org_name: "Google", website: "google-legal-support@google.com", toll_free_number: "1-800-123-4567")
@user.digitalprints.create(kind: "Email", account_id: @account.id)

@user.digitalprints.create(kind: "Phone", account_id: @account.id)
@user.digitalprints.create(kind: "Gender", account_id: @account.id)
@user.digitalprints.create(kind: "Biometric", account_id: @account.id)
@user.digitalprints.create(kind: "Birthdate", account_id: @account.id)
@user.digitalprints.create(kind: "Employment Details", account_id: @account.id)
@user.digitalprints.create(kind: "Credit Card", account_id: @account.id)


@account2 = Account.create(org_name: "Facebook", website: "info@fb.com", toll_free_number: "1-800-123-0000")
@user.digitalprints.create(kind: "Email", account_id: @account2.id)
@user.digitalprints.create(kind: "Phone", account_id: @account2.id)
@user.digitalprints.create(kind: "Biometric", account_id: @account2.id)
@user.digitalprints.create(kind: "Birthdate", account_id: @account2.id)
@user.digitalprints.create(kind: "Employment Details", account_id: @account2.id)
@user.digitalprints.create(kind: "Social Media User", account_id: @account2.id)
@user.digitalprints.create(kind: "Credit Card", account_id: @account2.id)
@user.digitalprints.create(kind: "Gender", account_id: @account2.id)

@account3 = Account.create(org_name: "Apple", website: "support@apple.com", toll_free_number: "1-800-123-4567")
@user.digitalprints.create(kind: "Email", account_id: @account3.id)
@user.digitalprints.create(kind: "Phone", account_id: @account3.id)
@user.digitalprints.create(kind: "Biometric", account_id: @account3.id)
@user.digitalprints.create(kind: "Birthdate", account_id: @account3.id)
@user.digitalprints.create(kind: "Employment Details", account_id: @account3.id)
@user.digitalprints.create(kind: "Social Media User", account_id: @account3.id)
@user.digitalprints.create(kind: "Credit Card", account_id: @account3.id)
@user.digitalprints.create(kind: "Gender", account_id: @account3.id)

@account4 = Account.create(org_name: "Netflix", website: "privacy@netflix.com", toll_free_number: "1-800-123-4567")
@user.digitalprints.create(kind: "Email", account_id: @account4.id)
@user.digitalprints.create(kind: "Phone", account_id: @account4.id)
@user.digitalprints.create(kind: "Credit Card", account_id: @account4.id)

@account5 = Account.create(org_name: "Amazon", website: "privacyshield@amazon.com", toll_free_number: "1-800-123-4567")
@user.digitalprints.create(kind: "Email", account_id: @account5.id)
@user.digitalprints.create(kind: "Phone", account_id: @account5.id)
@user.digitalprints.create(kind: "Biometric", account_id: @account5.id)
@user.digitalprints.create(kind: "Birthdate", account_id: @account5.id)
@user.digitalprints.create(kind: "Social Media User", account_id: @account5.id)
@user.digitalprints.create(kind: "Credit Card", account_id: @account5.id)
@user.digitalprints.create(kind: "Gender", account_id: @account5.id)



["Email", "Gender", "Credit Card", "Phone Number","SSN", "Social Media User", "Biometric", "Birthdate", "Employment Details"]

# geolocation, device IDs, identifying cookies, and browsing history
# Supply-side platforms (or SSPs) collect user data to sell, ad exchanges organize auctions between them and advertisers, 
# and demand-side platforms (or DSPs) “bid” on behalf of advertisers to decide which ads to show to which people
# https://www.eff.org/deeplinks/2020/03/google-says-it-doesnt-sell-your-data-heres-how-company-shares-monetizes-and

# DATA = {
#   :user_keys =>
#     ["first_name", "last_name", "email", "mobile_number", "password"],
#   :users => [
#     ["Max", "Charles", "max@test.com", "123-456-7890", "max"],
#     ["Skai", "Johnson", "skai@test.com", "123-456-7890", "skai"],
#     ["Kaleo", "Elam", "kaleo@test.com", "123-456-7890", "kaleo"],
#     ["Megan", "Carpenter", "megan@test.com", "123-456-7890", "megan"],
#     ["Davis", "Cleveland", "davis@test.com", "123-456-7890", "davis"]
#   ],
#   :account_keys =>
#    ["org_name", "website", "toll_free_number"],
#   :accounts => [
#     ["Google", "www.google.com", "1-800-123-4567"],
#     ["Facebook", "www.facebook.com", "1-800-123-4567"],
#     ["Apple", "www.apple.com", "1-800-123-4567"],
#     ["Netflix", "www.netflix.com", "1-800-123-4567"],
#     ["Amazon", "www.amazon.com", "1-800-123-4567"]
#   ],
#   :admins => [
#     "jon@test.com",
#     "admin@test.com"
#   ]
# }

# def main
#   make_users
#   make_admin
#   make_accounts_and_digitalprints
# end

# def make_users
#   DATA[:users].each do |user|
#     new_user = User.new
#     user.each_with_index do |attribute, i|
#       new_user.send(DATA[:user_keys][i]+"=", attribute)
#     end
#     new_user.save
#   end
# end

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

# main
