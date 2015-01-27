require("spec_helper")

describe(Product) do

  it("tells which purchase the product belongs to") do
    purchase1 = Purchase.create({:name => "Miss Avery"})
    product = Product.create({:name => "paddles", :price => 3000, :purchase_id => purchase1.id()})
    expect(product.purchase()).to(eq(purchase1))
  end

end
