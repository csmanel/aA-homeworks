require 'rspec'
require 'dessert'



describe Dessert do
  let(:chef) { double("chef", name: "Tucker") }
  let(:cookies) { Dessert.new("cookies", 100, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cookies.type).to eq("cookies")
    end

    it "sets a quantity" do
      expect(cookies.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(cookies.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookies.add_ingredient("chocolate")
      expect(cookies.ingredients).to include("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["chocolate", "flour", "egg", "sugar", "butter"]

      ingredients.each do |ingredient|
        cookies.add_ingredient(ingredient)
      end

      expect(cookies.ingredients).to eq(ingredients)
      cookies.mix!
      expect(cookies.ingredients).not_to eq(ingredients)
      expect(cookies.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookies.eat(20)
      expect(cookies.quantity).to eq(80)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookies.eat(120)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tucker the Great Baker")
      expect(cookies.serve).to eq("Chef Tucker the Great Baker has made 100 cookiess!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookies)
      cookies.make_more
    end
  end
end