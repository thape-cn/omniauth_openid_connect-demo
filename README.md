# README

Almost no use to following RailsCASTS [Simple OmniAuth](http://railscasts.com/episodes/241-simple-omniauth-revised) steps.

Specially thanks @jasl to help me work out to using with [oauth2id](https://github.com/thape-cn/oauth2id).

You can checking `config/initializers/omniauth.rb` to get a working config which working in oauth2id.dev with auto discovery.

Or reference as below:

```ruby
# WebFinger.url_builder = URI::HTTP # default URI::HTTPS

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid_connect,
           name: :openid_connect,
           scope: %i[openid departments positions main_position],
           response_type: :code,
           uid_field: 'email',
           nonce: false,
           issuer: 'https://oauth2id.test/',
           client_signing_alg: :RS256,
           client_jwk_signing_key: "{\"keys\":[{\"kty\":\"RSA\",\"kid\":\"bUwv9Lb5rRXlMvwg4fon2Yfk9FnZlsKmgYI1GQxxtcc\",\"e\":\"AQAB\",\"n\":\"lcSPGwLsG6f7rLi6fKcF3sR-nvcYWxAJl1xQqBaajqyma84gJA_elqOAmiBIvtGvdIrulokXZuxwjcJ_NCsyGNCJsRK4sImYKOU7zTvEyr3m6TCtT2Enb1dieegTJxiWirqHenp7lcOJAVpgqlWdG2W8DWfAt6_z_oyZ6_FgQB_gEdAy82jcpv9PQGJUQ1ZESVUMDAEjwRSR7hJHSGm94OrqmoplggKLGTYCihFAY_DFU4qxdAJ6yc_wyRY03_GcsFBnO2i5h3XBFJypWqc_pL95Iqn0cAU8L0vByq6drxuKDjU5MDQSDWinIGRBgZ2QK80pc5JATjLKkGmgxUIshw\",\"use\":\"sig\",\"alg\":\"RS256\"}]}",
           client_options: {
             scheme: 'https',
             host: 'oauth2id.test',
             identifier: Rails.application.credentials.openid_connect_identifier!,
             secret: Rails.application.credentials.openid_connect_secret!,
             redirect_uri: 'https://omniauth-openid-connect-demo.test/auth/openid_connect/callback',
             authorization_endpoint: '/oauth/authorize',
             token_endpoint: '/oauth/token',
             userinfo_endpoint: '/oauth/userinfo',
             jwks_uri: '/oauth/discovery/keys'
           }
end
```
