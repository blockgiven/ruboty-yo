module Ruboty
  module Adapters
    class MockAdapter < Base
      def run
      end

      def say(message)
        said_messages << message
      end

      def said_messages
        @said_messages ||= []
      end

      def said?(body)
        said_messages.any? {|m| m[:body] == body }
      end
    end
  end

  module Testable
    def said?(body)
      adapter.said?(body)
    end
  end

  Robot.prepend(Testable)
end
