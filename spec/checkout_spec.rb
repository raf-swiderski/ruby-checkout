require "checkout"

describe Checkout do

    before(:each) do
        @checkout = Checkout.new
        @item_001 = Item.new(001, "Lavender heart", 9.25)
        @item_002 = Item.new(002, "Personalised cufflinks", 45.00)
        @item_003 = Item.new(003, "Kids T-shirt", 19.95)
    end

    it "prints out the total" do
        expect(@checkout.total).to eq "Total price: £0.00"
    end
    
    it "print out the total when buying item 001" do
        @checkout.scan(@item_001)
        expect(@checkout.total).to eq "Total price: £9.25"
    end

    it "10% discount when spending over £60" do
        @checkout.scan(@item_002)
        @checkout.scan(@item_002)
        expect(@checkout.total).to eq "Total price: £81.00"
    end

    it "10% discount when spending over £60" do
        @checkout.scan(@item_001)
        @checkout.scan(@item_002)
        @checkout.scan(@item_003)
        expect(@checkout.total).to eq "Total price: £66.78"
    end

    it "if you buy 2 or more lavendar hearts the price of them drops to £8.50" do
        @checkout.scan(@item_001)
        @checkout.scan(@item_001)
        expect(@checkout.total).to eq "Total price: £17.00"
    end

    it "if you buy 2 or more lavendar hearts the price of them drops to £8.50" do
        @checkout.scan(@item_001)
        @checkout.scan(@item_003)
        @checkout.scan(@item_001)
        expect(@checkout.total).to eq "Total price: £36.95"
    end

    it "if you buy 2 or more lavendar hearts the price of them drops to £8.50" do
        @checkout.scan(@item_001)
        @checkout.scan(@item_002)
        @checkout.scan(@item_001)
        @checkout.scan(@item_003)
        expect(@checkout.total).to eq "Total price: £73.76"
    end

    it "items can scan in any order" do
        @checkout.scan(@item_003)
        @checkout.scan(@item_001)
        @checkout.scan(@item_002)
        @checkout.scan(@item_001)
        @checkout.scan(@item_003)
        expect(@checkout.total).to eq "Total price: £91.71"
    end

end