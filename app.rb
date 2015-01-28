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

get("/product/:id") do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product)
end

post("/add") do
  name = params.fetch("name")
  price = params.fetch("price").to_d()
  product = Product.create({:name => name, :price => price})
  redirect("/")
end

patch("/edit_name") do
  name = params.fetch("name")
  @product = Product.find(params.fetch("id").to_i())
  @product.update({:name => name})
  erb(:product)
end

patch("/edit_price") do
  price = params.fetch("price")
  @product = Product.find(params.fetch("id").to_i())
  @product.update({:price => price})
  erb(:product)
end

post("/delete_product") do
  @product = Product.find(params.fetch("id").to_i())
  @product.destroy()
  redirect("/")
end

post("/make_purchase") do
  product_id_array = params.fetch("product_ids")
  @purchase = Purchase.create({:name => "Purchase"})
  product_id_array.each() do |product_id|
    Product.find(product_id).update({:purchase_id => @purchase.id()})
  end
  erb(:purchase)
end
