require "ruboty/yo/actions/yo"

module Ruboty
  module Handlers
    class Yo < Base
      on /yo yo/, name: 'yo', description: 'TODO: write your description'

      def yo(message)
        Ruboty::Yo::Actions::Yo.new(message).call
      end
    end
  end
end
