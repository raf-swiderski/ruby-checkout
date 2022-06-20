require "checkout"

describe Checkout do

    before(:each) do
        @checkout = Checkout.new([
            :lavender_heart_promo,
            :ten_percent_basket_discount
        ])
        @item_001 = Item.new(001, "Lavender heart", 9.25)
        @item_002 = Item.new(002, "Personalised cufflinks", 45.00)
        @item_003 = Item.new(003, "Kids T-shirt", 19.95)
    end

    it "prints out the total" do
        expect(@checkout.total).to eq "Total price: £0.00"
    end
    
    it "prints out the total when buying item 001" do
        @checkout.scan(@item_001)
        expect(@checkout.total).to eq "Total price: £9.25"
    end

    it "can delete an item" do
        @checkout.scan(@item_002)
        @checkout.scan(@item_002)
        @checkout.delete(@item_002)
        expect(@checkout.total).to eq "Total price: £45.00"
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