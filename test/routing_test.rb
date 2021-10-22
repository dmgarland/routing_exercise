require 'minitest/autorun'
require 'minitest/emoji'
require 'rack/test'
require 'routing_example'
require 'models/fruit'
require 'pry'

describe 'Our amazing web app' do
  include Rack::Test::Methods

  before do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
    ActiveRecord::Base.connection.execute('CREATE TABLE fruits (id integer primary key, name string, colour string, value integer)')
  end

  after do
    ActiveRecord::Base.remove_connection
  end

  def app
    RoutingExample.new
  end

  describe 'getting the homepage' do
    before do
      get '/'
    end

    it 'shows a page' do
      _(last_response.status).must_equal 200
      _(last_response.content_type).must_equal 'text/html'
    end
  end

  describe 'getting an image' do
    before do
      get '/images/NADA_CAT.webp'
    end

    it 'shows a page' do
      _(last_response.status).must_equal 200
      _(last_response.content_type).must_equal 'image/webp'
    end
  end

  describe 'visiting the fruits page' do
    before do
      Fruit.create!(name: 'Apple', colour: 'red', value: 90)

      get '/fruits'
    end

    it 'does stuff' do
      _(last_response.status).must_equal 200
      _(last_response.content_type).must_equal 'text/html'
      _(last_response.body).must_match 'Apple'
      _(last_response.body).must_match 'red'
      _(last_response.body).must_match '0.90'
    end
  end

  describe 'creating a fruit' do
    before do
      post '/lovely-new-fruit', { name: 'Pear', colour: 'green', value: 70 }
    end

    it 'persists the record in the database' do
      pear = Fruit.last
      _(pear).wont_be nil
      _(pear.name).must_equal 'Pear'
      _(pear.colour).must_equal 'green'
      _(pear.value).must_equal 70
    end

    it 'redirects back to the fruits page' do
      _(last_response.redirect?).must_equal true
      _(last_response.headers['location']).must_equal '/'
    end
  end
end
