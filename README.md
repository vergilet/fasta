# Fasta

<img src="https://user-images.githubusercontent.com/2478436/48049394-346ac280-e1a7-11e8-946f-4f6fe5f422a8.png" width="150">


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
 $ fasta endpoint <ENDPOINT_NAME> <ACTION> <ACTION> <ACTION> ... # fasta endpoint account index show custom
```

After generate endpoint add the appropriate routes in **routes.rb** and extend a migration with needed fields:

```ruby
 # routes.rb

 $router = Fasta::Router.new do |mapper|
   ...
   mapper.reg(:<METHOD>, '/<PATH>', <ENDPOINT>::<ACTION>)  # mapper.reg(:get, '/accounts', Account::Index)
   ...
 end  
```

Also after set up migration file run:

```bash
 $ rake db:migrate
```


## Usage

TODO: 
1. Write usage instructions here
2. DB connect/close on each request
3. Show and Index considering


