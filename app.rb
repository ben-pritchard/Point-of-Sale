require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require('./lib/product')
require('./lib/purchase')
require("pry")
require('pg')

get('/') do
  @products = Product.all()
  @purchases = Purchase.all()
  erb(:index)
end

get("/product/:product_id") do
  
end
