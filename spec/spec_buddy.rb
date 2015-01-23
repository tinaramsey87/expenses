require('rspec')
require('product')
require('cost')
require('category')
require('pg')

DB = PG.connect({:dbname => 'expenses_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM product *;")
    DB.exec("DELETE FROM cost *;")
    DB.exec("DELETE FROM categories *;")
    # DB.exec("DELETE FROM join *;")
  end
end
