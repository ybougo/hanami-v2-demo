# frozen_string_literal: true

module Main
  module Utils
    module Paginable
      def paginate(relation, params)
        relation
          .per_page(params[:per_page] || 5)
          .page(params[:page] || 1)
      end
    end
  end
end
