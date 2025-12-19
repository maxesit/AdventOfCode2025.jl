module Day04

using AdventOfCode2025

function day04(input::String=readInput(joinpath(@__DIR__,"..","data","Day04","data-task1.txt")))
	stamp = [1 1 1
			 1 0 1
			 1 1 1]
	task1 = evaluateRolls(offsetRolls(findRolls(input)),stamp)[2]
	task2 = removeRolls(offsetRolls(findRolls(input)),stamp)
	[task1,task2]
end

# Reads input map and stores into a matrix
function findRolls(s)
	out = []
	for line in split(rstrip(s),"\n")
		push!(out,(collect(line).=='@').*1.0)
	end
	out = stack(out,dims=1)
end

function offsetRolls(roll_map)
	out = zeros(size(roll_map).+2)
	out[(2:end-1),(2:end-1)] = roll_map
	out
end

# offset the map before running
function evaluateRolls(roll_map,stamp)
	out_1 = copy(roll_map)
	rm = 0
	for i in 2:(size(roll_map,2)-1)
		for j in 2:(size(roll_map,1)-1)
			if sum(roll_map[j-1:j+1,i-1:i+1].*stamp)<4 && roll_map[j,i]==1
				out_1[j,i]=0
				rm+=1
			end
		end
	end
	return(out_1,rm)
end

function removeRolls(roll_map,stamp)
	out_2 = copy(roll_map)
	counter = 0
	removed = 1
	while removed >0
		out_2, removed = evaluateRolls(out_2,stamp)
		counter += removed
	end
	counter
end

end
