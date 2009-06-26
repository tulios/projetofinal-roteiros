# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_viajantes_session',
  :secret      => 'c2faf2df631e853ea2a205d145ae75b0590a7287335b42a28776c374950a7a19dcda8b34e2cf4f7a3082379f26afc4198181912ee5a4ba61c6982f8a91d321a0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
