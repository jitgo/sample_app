# # Be sure to restart your server when you modify this file.

# # Your secret key is used for verifying the integrity of signed cookies.
# # If you change this key, all old signed cookies will become invalid!

# # Make sure the secret is at least 30 characters and all random,
# # no regular words or you'll be exposed to dictionary attacks.
# # You can use `rake secret` to generate a secure secret key.

# # Make sure your secret_key_base is kept private
# # if you're sharing your code publicly.
# SampleApp::Application.config.secret_key_base = 'cecc59436a77a6f3453dcec70dd3401173c18a3a955da3d1ed80e4656f0d8cee78dcb8dc6247e954d9a66b448641a7599d5e9a756d18783d0f0f7df7c8fbc212'
# #'91da350cb3d9998304c70e647308ca26d2a0015495ba0c8fcbf89bec4f975c26e69b3258a4543f76ac07a7b474fc9db32b33247d98ed65e50b0eb51c614a4b08'
# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = secure_token