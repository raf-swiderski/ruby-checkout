require "checkout"

describe Checkout do

    before(:each) do
        @checkout = Checkout.new
        @item_001 = Item.new(001, "Lavender heart", 9.25)
        @item_002 = Item.new(002, "Personalised cufflinks", 45.00)
        @item_003 = Item.new(003, "Lavender heart", 19.95)
    end

    it "prints out the total" do
        expect(@checkout.total).to eq "Total price: £0.00"
    end
    
    it "print out the total when buying item 001" do
        @checkout.scan(@item_001)
        expect(@checkout.total).to eq "Total price: £9.25"
    end

    it "10% discount when spending over £60" do
        @checkout.scan(@item_001)
        @checkout.scan(@item_002)
        @checkout.scan(@item_003)
        expect(@checkout.total).to eq "Total price: £66.78"
    end


end