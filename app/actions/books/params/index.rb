# frozen_string_literal: true

module Main
  module Actions
    module Books
      module Params
        class Index < Hanami::Action::Params
          params do
            optional(:page).value(:integer, gteq?: 1)
            optional(:per_page).value(:integer, gt?: 0, lteq?: 50)
          end
        end
      end
    end
  end
end
