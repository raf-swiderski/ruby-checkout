require "checkout"

describe Checkout do

    it "prints out the bill" do
        @checkout = Checkout.new
        expect(@checkout.total).to eq "Total price: £0.00"
    end

end