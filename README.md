# Fasta
<p align="center">
   <a href="https://rubygems.org/gems/fasta"><img src="https://user-images.githubusercontent.com/2478436/48049394-346ac280-e1a7-11e8-946f-4f6fe5f422a8.png" width="256">
</a>
</p>


Fasta is a mini web framework

## Installation

```bash
 $ gem install fasta
```

```bash
 $ fasta plz NEW_APP_NAME
```

```bash
 $ cd NEW_APP_NAME
```

## Start

Before first start run
```bash
 $ rake db:create
```

To start server:
```bash
 $ fasta go [-e ENVIRONMENT] [-p PORT]
```

or advanced
```bash
 $ puma boot.ru -e production -p 3210
```

## Add Endpoint

```bash
 $ fasta endpoint <ENDPOINT_NAME> <ACTION> <ACTION> <ACTION> ... 
 # fasta endpoint account index show custom
```

After generate endpoint add the appropriate routes in **routes.rb** and extend a migration with needed fields:

```ruby
 # routes.rb

 $router = Fasta::Router.new do |mapper|
   ...
   mapper.reg(:<METHOD>, '/<PATH>', <ENDPOINT>::<ACTION>)  
   
 # mapper.reg(:get, '/accounts', Account::Index)
   ...
 end  
```

Also after set up migration file run:

```bash
 $ rake db:migrate
```


## Associated Entities

```ruby
    # app/endpoints/user/boards.rb

    module User
      class Boards < Model::Show
        validate_fields :id
        
        def fetch
          user_id = params[:id]
          through = DB[:users_boards].where(user_id: user_id)
          DB[:boards].where(id: through.select(:board_id)).to_a
        end
      end
    end

```

```ruby
    # routes.rb
    $router = Fasta::Router.new do |mapper|
      ...
      mapper.reg(:get, '/users/:id/boards', User::Boards) 
      ...
    end
```

### Namespaces

```ruby
    # app/endpoints/team/user.rb
    
    module Team
      module User
        extend Model
      end
    end
 
```

```ruby
    # app/endpoints/team/user/index.rb
    
    module Team
      module User
        class Index < Model::Index; end
      end
    end 

```

```ruby
    # routes.rb
    $router = Fasta::Router.new do |mapper|
      ...
      mapper.reg(:get, 'team/users', Team::User::Index)
      ...
    end  
```

## Usage

TODO: 
1. Write usage instructions here
2. Show and Index considering
