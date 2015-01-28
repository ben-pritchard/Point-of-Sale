require('spec_helper')

describe(Purchase) do
  it("tells which products associate with the purchase") do
    purchase = Purchase.create({:name => "Jason"})
    product1 = Product.create({:name => "hockey mask", :price => 150, :purchase_id => purchase.id()})
    product2 = Product.create({:name => "large kitchen knife", :price => 350, :purchase_id => purchase.id()})
    expect(purchase.products()).to(eq([product1, product2]))
  end
end
