# frozen_string_literal: true

module Main
  module Repositories
    class Books < Repository[:books]
      commands :create

      def sorted_books(order:)
        books.order(order)
      end
    end
  end
end
