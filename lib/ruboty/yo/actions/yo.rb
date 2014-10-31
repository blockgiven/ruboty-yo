module Ruboty
  module Yo
    module Actions
      class Yo < Ruboty::Actions::Base
        def call
          params = {api_token: ENV['YO_API_TOKEN'], username: message[:to]}
          res = Net::HTTP.post_form(::Ruboty::Yo::ENDPOINT_URL, params)

          unless res.is_a?(Net::HTTPOK)
            message.reply("伝わらなかったよ")
          end
        end
      end
    end
  end
end
