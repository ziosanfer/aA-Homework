require 'rspec'
require 'dessert'

describe Dessert do
  let(:chef) { double("Yahweh") }
  let(:me) { Dessert.new("O+", 167, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(me.type).to eq("O+")
    end

    it "sets a quantity" do
      expect(me.quantity).to eq(167)
    end

    it "starts ingredients as an empty array" do
      expect(me.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("chicken", "167 cm", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      me.add_ingredients("cheese")
      me.add_ingredients("chicken feet")
      me.add_ingredients("beans")
      expect(me.ingredients).to eq(["cheese", "chicken feet", "beans"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      me.add_ingredients("cheese")
      me.add_ingredients("chicken feet")
      me.add_ingredients("beans")
      antes = ["cheese", "chicken feet", "beans"]
      expect(antes).to_not eq(me.mix!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(me.eat(60)).to eq(107)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {me.eat(168)}.to raise_error(ArgumentError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to take(:titleize).and_return("Chef Yahweh the Great Baker")
      expect(me.serve).to eq("Chef Yahweh the Great Baker has served 167 O+s!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(me)
      expect(me.temp).to eq(400)
    end
  end
end
