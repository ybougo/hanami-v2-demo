# auto_register: false
# frozen_string_literal: true

require 'hanami/action'
require 'debug' if Hanami.env?(:development)

module Main
  class Action < Hanami::Action
    config.handle_exception ROM::TupleCountMismatchError => :handle_not_found

    before :set_headers

    private

    def handle_not_found(_req, res, _exception)
      res.status = 404
      res.body = { error: 'not_found' }.to_json
    end

    def set_headers(_req, res)
      res.format = :json
    end

    # def deserialize(_req, _res)
    #   return if params[:data].present?

    #   halt 400, 'Unprocessable Entity'
    # end

    # def authorize(req, _res)
    #   return if authorizer.call(req.params, auth).success?

    #   halt 403, 'Unauthorized'
    # end

    def validate(req, _res)
      return if req.params.valid?

      halt 422, req.params.errors.to_json
    end
  end
end
