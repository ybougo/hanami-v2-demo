# frozen_string_literal: true

module Main
  module Actions
    module Books
      module Params
        class Show < Hanami::Action::Params
          params do
            required(:id).value(:integer, gteq?: 0)
          end
        end
      end
    end
  end
end
