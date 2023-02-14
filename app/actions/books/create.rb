# frozen_string_literal: true

module Main
  module Actions
    module Books
      class Create < Main::Action
        include Deps[interactor: 'interactors.books.create']
        params Params::Create

        before :validate

        def handle(req, res)
          book = interactor.call(req.params[:book])
          res.status = 201
          res.body = { book_id: book.id }.to_json
        end
      end
    end
  end
end
