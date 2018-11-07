require 'hanami/router'
require_relative 'routes_mapper'

module Fasta
  class Router
    def initialize
      @router = Hanami::Router.new do
        action = ->(klass) { ->(env) { klass.call(env) } }
        root to: ->(_env) { [200, {}, ['Welcome to API']] }

        mapper = Fasta::RoutesMapper.new(action, self)

        yield(mapper)
      end
    end

    def runnable
      router
    end

    attr_reader :router
  end
end
