Rails.application.config.middleware.use OmniAuth::Builder do
  provider :starladder, '957c3669c5ec514fe0b895f9555f5eadda2fbaf5d5757a4a8c926d4f02b013f9', 'ddddc41aa306efd9361b5769bdafabc2d273e78af40cc3ba47b54eb9bd631f59'
end
# auth/starladder/callback

module OmniAuth
  module Strategies
    class Starladder < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "starladder"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {:site => "https://auth.starladder.com/en/oauth/authorize"}

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
            :name => raw_info['name'],
            :email => raw_info['email']
        }
      end

      extra do
        {
            'raw_info' => raw_info
        }
      end

      def raw_info
        p 'zzzz', access_token,access_token.get('/me'),'xxx'
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end
