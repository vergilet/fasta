require 'fasta/server/actions'
require 'fasta/app/endpoints/model/create'
require 'fasta/app/endpoints/model/delete'
require 'fasta/app/endpoints/model/index'
require 'fasta/app/endpoints/model/patch'
require 'fasta/app/endpoints/model/put'
require 'fasta/app/endpoints/model/show'

# Do @@db_table_name as table name for current module

module Fasta
  module Model
    def db_table_name
      (name.downcase + 's').gsub('::', '_').to_sym
    end
  end
end
