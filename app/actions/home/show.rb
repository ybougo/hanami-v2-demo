# frozen_string_literal: true

module Main
  module Actions
    module Home
      class Show < Main::Action
        def handle(*, response)
          response.body = 'Welcome to Bookshelf'
        end
      end
    end
  end
end
