OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '791800674289782', '1ec1b0b7094842da392c2fe755d0fd1e', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end