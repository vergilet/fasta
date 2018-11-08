require 'thor'

module Fasta
  class Installer < Thor
    DEFAULT_ACTIONS = %w[show index create delete patch put].freeze
    DEFAULT_ACTION = :show

    include Thor::Actions
    source_root File.expand_path('../../templates', __dir__)

    desc 'plz NAME', 'Unpack Project'
    def plz(name)
      directory 'config', "#{name}/config"
      create_file "#{name}/app/endpoints/.keep"
      create_file "#{name}/log/db.log"
      directory 'app', "#{name}/app"
      copy_file 'db/migrations/001_create_users_table.rb', "#{name}/db/migrations/001_create_users_table.rb"
      copy_file 'application.rb', "#{name}/application.rb"
      copy_file 'boot.ru', "#{name}/boot.ru"
      copy_file 'Gemfile', "#{name}/Gemfile"
      copy_file 'Procfile', "#{name}/Procfile"
      copy_file 'Rakefile', "#{name}/Rakefile"
    end

    desc 'go', 'Start your application very fast!'
    method_option :environment, default: 'development', aliases: "-e"
    method_option :port, default: '3210', aliases: "-p"
    def go
      exec("puma boot.ru -e #{options[:environment]} -p #{options[:port]}")
    end

    desc 'endpoint', 'Create new Endpoint'
    def endpoint(name, *actions)
      normalized_name = name.downcase
      create_file "./app/endpoints/#{normalized_name}.rb",
      "module #{normalized_name.capitalize}
  extend Fasta::Model
end
"
      create_file "./app/endpoints/#{normalized_name}/.keep"
      actions.each do |action|
        default_action = DEFAULT_ACTIONS.include?(action)
        build_action(normalized_name, action, default_action)
      end

      build_migration(normalized_name)
    end

    private

    def build_action(endpoint_name, action_name, default_action)
      fasta_action = default_action ? action_name : DEFAULT_ACTION

      create_file "./app/endpoints/#{endpoint_name}/#{action_name}.rb",
                  "module #{endpoint_name.capitalize}
  class #{action_name.capitalize} < Fasta::Model::#{fasta_action.capitalize}
  end
end
"
    end

    def build_migration(endpoint_name)
      create_file "./db/migrations/#{Time.now.strftime('%Y%m%d%H%M%S')}_create_#{endpoint_name}s_table.rb",
      "Sequel.migration do
  change do
    create_table(:#{endpoint_name}s) do
      primary_key :id
      DateTime    :created_at,              null: false
      DateTime    :updated_at,              null: false
    end
  end
end
"
    end
  end
end
