require "checkout"

describe Checkout do

    before(:each) do
        @checkout = Checkout.new
        @item_001 = Item.new(001, "Lavender heart", 9.25)
    end

    it "prints out the total" do
        expect(@checkout.total).to eq "Total price: £0.00"
    end
    
    it "print out the total when buying item 001" do
        @checkout.scan(@item_001)
        expect(@checkout.total).to eq "Total price: £9.25"
    end


end