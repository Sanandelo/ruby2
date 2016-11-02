module Enumerable
	def my_each
		
		result = []
		0.upto(self.length-1)do |numb| 
			yield(self[numb]) 
			result.push(self[numb])
		end
		return result
	end

	def my_each_with_index
		result =[]
		0.upto(self.length-1)do |numb| 
			yield(self[numb], numb) 
			result.push(self[numb])
		end
		return result
	end

	def my_select
		result = []

		self.my_each do |i|
			if yield(i)
				result.push(i)
			end
		end
		return result
	end

	def my_all?
		result = true
		self.my_each do |i|
			unless yield(i)
				result = false
			end
		end
		return result
	end

	def my_any?
		result = false
		self.my_each do |i|
			if yield(i)
				result = true
			end
		end
		return result
	end

	def my_none?
		result = true
		self.my_each do |i|
			if yield(i)
				result = false
			end
		end
		return result
	end

	def my_count (val= self.size)
		count = 0 
		if block_given?
			self.my_each do |v|
				if yield(v)
					count +=1
				end
			end
		else
			if val == self.size
				count = val
			else
				self.my_each do |v|
					if v == val 
					count +=1
					end
				end
			end
		end			
		return count
	end

	def my_map(proc= nil)
		result = []
		self.my_each do |v|
			if !proc.nil? && block_given?
				var = proc.call(v)
				result << var
			elsif proc.nil? && block_given?
				var = yield(v)
				result << var
			end
		end
		return result
	end

	def my_inject(init)

			if init.nil?
			init = self[0]
			memo = init
				self.my_each_with_index do |v,i|
					if i !=0				 
						val = yield(memo, v)
						memo = val
					end
				end
			else
			memo = init
				self.my_each do |v|				 
						val = yield(memo, v)
						memo = val
					
				end
			end

		return memo
	end
	def my_map_alt(proc=nil) #my_map with optional proc handling
	return self unless block_given?
		result = []
		if proc
			for i in self
				result << proc.call(yield(i))
			end
		else
			for i in self
				result << yield(i)
			end
		end
		return result
	end
end







# [1,2,3,2,3,4].my_each do |i|
# 	print i
# end
# puts " "
# [1,2,3,2,3,4].my_each_with_index do |i, ind|
# 	print "#{ind}: #{i}  "
# end

# [1,2,3,4,5,6,7,8,9,10,23,26,30,49].my_select do |ind|
# 	ind%2 ==0
# end

# [3,9,6,12,18,19].my_all? do |v|
# 	v%3 == 0
# end
# [3,9,6,12,18,19].my_any? do |v|
# 	v == 3
# end
# [3,9,6,12,18,19].my_none? do |v|
#  	v==2
#  end

# var1 = [1,3,5,2,6,1,2,1].my_count

# var2 = [1,3,5,2,6,1,2].my_count(1)

# var3 = [1,3,5,2,6,1,2,1,4,8].my_count {|x| x%2 == 0}

# puts "#{var1}    #{var2}     #{var3}"

# arr = [1,2,3,4,5,6].my_map do |v|
# 	v**2
# end
# puts arr

# var = [6,6,7,8,5,12].my_inject(6) {|sum,n| sum + n }
# puts var

# def multiply_els arr
# 	var = arr.my_inject(1){|mult,n| mult*n}
# 	var
# end
# proces = Proc.new do |v|
# 	v*2
# end
# var = [1,3,4,6,2,3].my_map(proces){|v| v.to_s + "babababa"}




