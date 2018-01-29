
class Array
	def my_bsearch(&block)
		a=0
		z=self.size
		until z-a <= 1 do
			m=(a+z)/2
			v = block.call(self[m])
			if v==0 then
				return m
			elsif v>0 then
				a=m
			elsif v<0 then
				z=m
			end
		end
		return nil
	end
end

if __FILE__ == $0 then
	base_arr = []
	i = 0
	n = 0
	rand_src= Random.new
	until 1000_000_0 <= base_arr.size do
		if 0 < rand_src.rand(0..4) then # match 1 out of 5 times
			base_arr[i] = n
			i+= 1
		end
		n += 1
	end
	
	puts "# of i:#{i}"
	puts "# of n:#{n}"
	
	target_num = base_arr[rand_src.rand(i/2..i)] # ensure base_arr has target_num but choose as high number as possible
	puts "target_num is #{target_num}"
	
	puts "With include?():"
	s=Time.now
	idx =  base_arr.index(target_num)
	e=Time.now
	index_time= e.to_i*1000_000+e.usec - s.to_i*1000_000+s.usec
	puts "Found the index [#{idx}] in #{index_time} usec."
	
	puts "With bsearch():"
	s=Time.now
	puts base_arr.bsearch{|x| target_num-x}.nil? ? false : true
	e=Time.now
	bsearch_time = (e.to_i*1000_000+e.usec) - (s.to_i*1000_000+s.usec)
	puts "Found in #{bsearch_time} usec"
	
	puts "bsearch is #{index_time/bsearch_time} times faster than include? with #{i} numbers in array!!"
	
	puts "With my_bsearch():"
	s=Time.now
	idx = base_arr.my_bsearch{|x| target_num-x}
	e=Time.now
	my_bsearch_time = (e.to_i*1000_000+e.usec) - (s.to_i*1000_000+s.usec)
	puts "Found the index [#{idx}] in #{my_bsearch_time} usec."
end

