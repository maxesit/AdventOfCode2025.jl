module Day03

using AdventOfCode2025

function day03(input::String=readInput(joinpath(@__DIR__,"..","data","Day03","data-task1.txt")))
	task1 = sum(findMaxJoltage.(3,transformInput(input)))
	task2 = sum(findMaxJoltage.(12,transformInput(input)))
	[task1, task2]
end

function transformInput(s::String)
	out = []
	for bank in split(rstrip(s),"\n")
		push!(out, bank)
	end
	out
end


# Finds the highest digit that still allows the number to be created
function findMaxInRow(PosDigit, NumDigit, Row)                                   
	argmax(parse.(Int,collect(Row[1:(length(Row)-(NumDigit-PosDigit))])))
end


# Retruns joltage of [numOn] batteries to turn on for the bank [bank].
function findMaxJoltage(numOn, bank)
	bats = [] # indexes of batteries to turn on
	push!(bats,findMaxInRow(1,numOn,bank))
	for i in 2:numOn
    	push!(bats,(bats[i-1]+findMaxInRow(i,numOn,bank[(bats[i-1]+1):end])))
    end
	parse(Int,join(collect(bank)[bats]))
end


end# End of Day03