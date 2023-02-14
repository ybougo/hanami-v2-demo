# frozen_string_literal: true

module Main
  module Actions
    module Books
      module Params
        class Create < Hanami::Action::Params
          params do
            required(:book).hash do
              required(:title).filled(:string)
              required(:author).filled(:string)
            end
          end
        end
      end
    end
  end
end
