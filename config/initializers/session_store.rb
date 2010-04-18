# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_alumni_session',
  :secret      => 'eb49c3aa443207d6a1c0d32279219bd828a2c997f042ed421ef2060461c2dfcd33a13efc6c1b6f51565a4e3042722b3ef1bf7f72af57b2791fd5f28fe44f001c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
