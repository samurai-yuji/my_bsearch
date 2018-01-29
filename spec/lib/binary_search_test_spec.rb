require "spec_helper"
require "binary_search_test"

describe Array  do
	before(:each) do # :each is default values
		@arr = [1,3,5,10,20,100]
		@big_arr = [*(0..1000000)]
	end

	it "is success cases of my_bsearch" do
		aggregate_failures do
		    expect(@arr.my_bsearch{|x| 5-x}).to eq 2
		    expect(@arr.my_bsearch{|x| 100-x}).to eq 5
		    expect(@big_arr.my_bsearch{|x| 1000-x}).to eq 1000
		    expect(@big_arr.my_bsearch{|x| 1000000-x}).to eq 1000000
		    expect(@big_arr.my_bsearch{|x| 0-x}).to eq 0
		end
	end

	it "is failure cases of my_bsearch" do
		aggregate_failures do
		    expect(@arr.my_bsearch{|x| 6-x}).to eq nil
		    expect(@arr.my_bsearch{|x| 200-x}).to eq nil
		    expect(@arr.my_bsearch{|x| 0-x}).to eq nil
		end
	end
end
