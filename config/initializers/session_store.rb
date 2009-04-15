# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nawara.com_session',
  :secret      => 'b2539a36fa2157a52191a9587f671e96b6f1f930ba51bb71032a64da4ce9720790b4997f06465877c2ac17e319dfe539a57a482b4cfce27b208f283c3390b0da'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
