# frozen_string_literal: true

module Main
  module Persistence
    module Relations
      class Books < ROM::Relation[:sql]
        schema(:books, infer: true)

        use :pagination
        per_page 5

        auto_struct :true
      end
    end
  end
end
