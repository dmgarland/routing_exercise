require 'rack'

require './app/routing_example'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')
ActiveRecord::Base.connection.execute('CREATE TABLE IF NOT EXISTS fruits (id integer primary key, name string, colour string, value integer)')

run RoutingExample.new

at_exit do
  ActiveRecord::Base.remove_connection
end
