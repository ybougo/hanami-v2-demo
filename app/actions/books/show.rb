# frozen_string_literal: true

module Main
  module Actions
    module Books
      class Show < Main::Action
        include Deps[repo: 'repositories.books']
        params Params::Show

        before :validate

        def handle(req, res)
          relation = repo.by_id(req.params[:id])
          res.body = serialize(relation)
        end

        private

        def serialize(entity)
          entity.to_h.to_json
        end
      end
    end
  end
end
