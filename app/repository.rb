# auto_register: false
# frozen_string_literal: true

require 'rom-repository'

module Main
  class Repository < ROM::Repository::Root
    include Deps[container: 'persistence.rom']

    struct_namespace Entities

    commands :create

    def all
      root
    end

    def by_id(id)
      root.by_pk(id).one!
    end
  end
end
