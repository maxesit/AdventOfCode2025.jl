module Day07

using AdventOfCode2025

function day07(input::String=readInput(joinpath(@__DIR__,"..","data","Day07","data-task1.txt")))
	task1, task2 = countJunctions(transformInput(input))
	[Int(task1), Int(task2)]
end

function translate(c)
	if c == '.'
		return 0
	elseif c == 'S'
		return -5
	elseif c == '^'
		return -1
	elseif c == '|'
		return 1
	else
		error("Incorrect input for function translate()")
	end
end

# Takes input string -> Outputs the respective matrix 
## Matrix rules : 
# -5 for S
# 0 for .
# -1 for ^
# 1 for |
# +n for n-timelines of |
function transformInput(s)
	temp = split(s)
 	out = zeros(size(temp,1),length(temp[1]))
	for i in 1:size(out,1)
		out[i,:] = map(x->translate(x), collect(temp[i]))
	end
	out
end

function countJunctions(manifold)
	counter = 0
	temp = copy(manifold)
	n_layers, d_layers = size(manifold)
	temp[2,findfirst(x->x==-5.0,manifold[1,:])] = 1
	for i in 2:n_layers
		for j in 1:d_layers
			if temp[i,j] >= 0 # '.' and '|'
				temp[i,j] += (temp[i-1,j] > 0) ? temp[i-1,j] : 0
			elseif temp[i,j] == -1 # '^'
				if temp[i-1,j] > 0 
					temp[i,j-1] += temp[i-1,j]
					temp[i,j+1] += temp[i-1,j]
					counter+=1
				end
			end
		end
	end
	[counter, sum(temp[end,:])]
end

end
