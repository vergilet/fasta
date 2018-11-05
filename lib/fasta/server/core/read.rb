require 'fasta/server/core/responder'

module Fasta
  module Server
    module Core
      class Read < Responder
        def call
          @body = fetch
        end
      end
    end
  end
end
