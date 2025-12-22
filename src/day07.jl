module Day07

using AdventOfCode2025

function day07(input::String=readInput(joinpath(@__DIR__,"..","data","Day07","data-task1.txt")))
	task1 = countJunctions(transformInput(input))
	task2 = -1
	[task1,task2]
end

function translate(c)
	if c == '.'
		return 0
	elseif c == 'S'
		return -1
	elseif c == '^'
		return 4
	elseif c == '|'
		return 1
	else
		error("Incorrect input for function translate()")
	end
end

# Takes input string -> Outputs the respective matrix 
function transformInput(s)
	temp = split(s)
	# Matrix rules : 
	# -1 for S
	# 0 for .
	# 4 for ^
	# 1 for | 
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
	temp[2,findfirst(x->x==-1.0,manifold[1,:])] = 1
	for i in 2:n_layers
		for j in 1:d_layers
			if temp[i,j] == 0 # '.'
				temp[i,j] = (temp[i-1,j] == 1) ? 1 : 0
			elseif temp[i,j] == 4 # '^'
				if temp[i-1,j] == 1
					temp[i,j-1] = 1
					temp[i,j+1] = 1
					counter+=1
				end
			end
		end
	end
	counter
end

end
