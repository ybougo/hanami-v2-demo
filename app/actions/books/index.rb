# frozen_string_literal: true

module Main
  module Actions
    module Books
      class Index < Main::Action
        include Deps[repo: 'repositories.books']
        include Utils::Paginable
        params Params::Index

        before :validate

        def handle(req, res)
          res.status = 200
          relation = repo.sorted_books(order: :title)
          paginated = paginate(relation, req.params)
          res.body = serialize(paginated)
        end

        private

        def serialize(collection)
          collection.map(&:to_h).to_json
        end
      end
    end
  end
end
