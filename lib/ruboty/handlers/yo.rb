require "ruboty/yo/actions/yo"

module Ruboty
  module Handlers
    class Yo < Base
      env :YO_API_TOKEN, 'yo api token'

      on /.*(yo|よ) (?<to>.*)$/, name: 'yo', description: 'send yo', all: true

      def yo(message)
        Ruboty::Yo::Actions::Yo.new(message).call
      end
    end
  end
end
