require "./src/helpers.rb"

include Helpers

describe Helpers do 
    describe ".take_time" do
        it "should return in seconds when receive less than 60" do
            expect(Helpers.take_time(40)).to eq("40s")
        end

        it "should return minutes when receive equals 60" do
            expect(Helpers.take_time(60)).to eq("1min")
        end

        it "should return minutes and rest seconds when receive greater than 60" do
            expect(Helpers.take_time(130)).to eq("2min 10s")
        end
    end
end