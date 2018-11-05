module User
  class Create < Fasta::Model::Create
    validate_fields :email, :phone_number
  end
end
