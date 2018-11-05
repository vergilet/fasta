require 'fasta/server/core/read'

module Fasta
  module Server
    module Actions
      class Index < Server::Core::Read
        def fetch
          db_table.all
        end
      end
    end
  end
end
