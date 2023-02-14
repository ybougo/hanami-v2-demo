# frozen_string_literal: true

module Main
  module Interactors
    module Books
      class Create
        include Deps[repo: 'repositories.books']
        def call(input)
          # TODO: db validate
          attrs = validate(input)
          create(attrs)
        end

        private

        def validate(input)
          input
        end

        def create(attrs)
          repo.create(attrs)
        end
      end
    end
  end
end
