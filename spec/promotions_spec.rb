# Testing the different Promotions kept in the Promotions module. 

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

    # apply_basket_discount method test

    it "has a 10% discount on the total when spending over £60" do
        @checkout.scan(@item_002)
        @checkout.scan(@item_002)
        expect(@checkout.total).to eq "Total price: £81.00"
    end

    it "has a 10% discount on the total when spending over £60" do
        @checkout.scan(@item_001)
        @checkout.scan(@item_002)
        @checkout.scan(@item_003)
        expect(@checkout.total).to eq "Total price: £66.78"
    end

    # apply_lavender_heart_promotion method test

    it "drops the price of lavendar hearts to £8.50 if you buy 2 or more of them" do
        @checkout.scan(@item_001)
        @checkout.scan(@item_001)
        expect(@checkout.total).to eq "Total price: £17.00"
    end

    it "if you buy 2 or more lavendar hearts the price of them drops to £8.50" do
        @checkout.scan(@item_001)
        @checkout.scan(@item_002)
        @checkout.scan(@item_001)
        @checkout.scan(@item_003)
        expect(@checkout.total).to eq "Total price: £73.76"
    end

    it "removes the the promotion when you remove a lavendar heart from the basket, taking it below the promotion threshold." do 
        @checkout.scan(@item_001)
        @checkout.scan(@item_001) # @checkout.total => "Total price: £17.00"
        @checkout.delete(@item_001)
        expect(@checkout.total).to eq "Total price: £9.25"
    end

end