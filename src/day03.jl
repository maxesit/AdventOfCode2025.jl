module Day03

using AdventOfCode2025

function day03(input::String=readInput(joinpath(@__DIR__,"..","data","Day03","data-task1.txt")))
	task1 = sum(findMaxJoltage.(transformInput(input)))
	task2 = -1
	[task1, task2]
end

function transformInput(s::String)
	out = []
	for bank in split(rstrip(s),"\n")
		push!(out, bank)
	end
	out
end

function findMaxJoltage(bank)
	max = 0
	for i in 1:length(bank)
    	for j in (i+1):length(bank)
        	max = parse(Int,bank[i]*bank[j]) > max ? parse(Int,bank[i]*bank[j]) : max
        end
    end
	max
end


end# End of Day03