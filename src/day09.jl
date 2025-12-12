module Day09

using AdventOfCode2025

function day09(input::String=readInput(joinpath(@__DIR__,"..","data","Day09","data-task1.txt")))
	task1 = findMax(inputData(input))
	[task1]
end

function inputData(s::String)
	out = []
	for pair in split(rstrip(s),"\n")
		l,r = split(rstrip(pair),",")
		push!(out,parse.(Int,[l,r]))
	end
	out
end

checkArea(a,b) = (abs(a[1]-b[1])+1)*(abs(a[2]-b[2])+1)

function findMax(dat)
	max = 0
	for i in 1:size(dat,1)
    	for j in i:size(dat,1)
    		cA = checkArea(dat[i],dat[j]) 
			max = max < cA ? cA : max
        end
    end
	max
end

end
