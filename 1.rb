def bubble_sort(arr)
	n = arr.length
	loop do
		swapped = false
		for i in (1...n)
			if arr[i-1] > arr[i]
				val_i_1 = arr[i-1]
				val_i = arr[i]
				arr[i] = val_i_1
				arr[i-1] = val_i
				swapped = true
			end
		end
		n = n -1
	break if swapped == false	
	end
	return arr
end


bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(arr)
	n = arr.length
	
	loop do
		swapped = false
		for i in (1...n)
			res = yield(arr[i-1], arr[i])
			if  res > 0
				val_i_1 = arr[i-1]
				val_i = arr[i]
				arr[i] = val_i_1
				arr[i-1] = val_i
				swapped = true
			end
		end
		n = n -1
	break if swapped == false	
	end
	return arr
	yield 
end


bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end
