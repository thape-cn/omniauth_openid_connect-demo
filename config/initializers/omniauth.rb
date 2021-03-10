# WebFinger.url_builder = URI::HTTP # default URI::HTTPS

OmniAuth.config.request_validation_phase do |env|
  Gitlab::RequestForgeryProtection.call(env)
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid_connect,
           name: :openid_connect,
           scope: %i[openid email profile departments positions main_position],
           response_type: :code,
           uid_field: 'email',
           issuer: 'https://sso-id.com',
           discovery: true,
           # Or get signing key from https://oauth2id.test/oauth/discovery/keys && uncomment below 2 line to disable discovery
           # client_signing_alg: :RS256,
           # client_jwk_signing_key: '',
           client_options: {
             scheme: 'https',
             host: 'sso-id.com',
             identifier: Rails.application.credentials.openid_connect_identifier!,
             secret: Rails.application.credentials.openid_connect_secret!,
             redirect_uri: 'https://omniauth-openid-connect-demo.test/auth/openid_connect/callback',
             authorization_endpoint: '/oauth/authorize',
             token_endpoint: '/oauth/token',
             userinfo_endpoint: '/oauth/userinfo',
             jwks_uri: '/oauth/discovery/keys'
           }
end
