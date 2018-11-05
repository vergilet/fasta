require 'fasta'
require './config/environment'
Dir['./app/endpoints/**/*.rb'].each { |file| require file }
Dir['./app/endpoints/**/**/*.rb'].each { |file| require file }

require './config/routes.rb'
