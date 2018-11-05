module User
  class Delete < Fasta::Model::Delete
    validate_fields :id
  end
end
