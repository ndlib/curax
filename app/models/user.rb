class User < ApplicationRecord
  # Connects this user object to Hydra behaviors.
  include Hydra::User
  # Connects this user object to Hyrax behaviors.
  include Hyrax::User
  include Hyrax::UserUsageStats

  if Blacklight::Utils.needs_attr_accessible?
    attr_accessible :email, :password, :password_confirmation
  end
  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User

  # cas_authenticatable: CAS authentication support for Devise (https://github.com/nbudin/devise_cas_authenticatable)
  # rememberable: manages generating and clearing a token for remembering the user from a saved cookie. (http://www.rubydoc.info/github/plataformatec/devise/master/Devise/Models/Rememberable)
  # trackable: tracks sign in count, timestamps and IP address. (http://www.rubydoc.info/github/plataformatec/devise/master/Devise/Models/Trackable)
  devise :cas_authenticatable, :rememberable, :trackable

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    email
  end
end
