require 'fasta/services/router'

$router = Fasta::Router.new do |mapper|
  mapper.reg(:get,    '/users',            User::Index)
  mapper.reg(:post,   '/users',            User::Create)
  mapper.reg(:get,    '/users/:id',        User::Show)
  mapper.reg(:put,    '/users/:id',        User::Put)
  mapper.reg(:patch,  '/users/:id',        User::Patch)
  mapper.reg(:delete, '/users/:id',        User::Delete)
  mapper.reg(:get,    '/users/:id/boards', User::Boards)
end

# get     '/accounts',         to: action.call(Account::Index)
# get     '/accounts/:id',     to: action.call(Account::Show)
# get     'team/users',        to: action.call(Team::User::Index)

