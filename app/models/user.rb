class User < ActiveRecord::Base
  has_secure_password

  # A User has many secrets (the secrets they created)
  has_many :secrets
  # A User has many likes (the likes they created)
  has_many :likes, dependent: :destroy
  # A User has many Secrets through the likes table (the secrets they has liked)
  has_many :secrets_liked, through: :likes, source: :secret

  # But wait...If we call the secrets method on the instance of a User, User.first.secrets,
  # is ActiveRecord going to query all the secrets that the user has created or all the secrets
  # that the user has liked? The answer is that it will query all the secrets that the user has liked!

  # To fix this problem we're going to have to give an ALIAS to one of our has_many relationships,
  # in this case secrets is given the alias secrets_liked (you can call the alia whatever you want)
  # and use :source to explicitly tell Rails which table we're referring to (secret).
end
