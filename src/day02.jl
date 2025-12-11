module Day02

using AdventOfCode2025

function day02(input::String=readInput(joinpath(@__DIR__,"..","data","Day02","data-task1.txt")))
	task1 = sum(countIDs.(inputData(input)[:]))
	[task1]
end

function inputData(s::String)
	out = []
	for pair in split(rstrip(s),",")
		 push!(out,parse.(Int,split(pair,"-")))
	end	
	out
end

# n = floor(log(10,x)) -> x of order 10^n
function firstHalfLeft(L)
	nL = trunc(log10(L))+1
	if iseven(nL)
		Int(div(L,10^(nL/2)))
	else
		Int(10^div(nL,2))
	end
end

function firstHalfRight(R)
	nR = trunc(log10(R))+1
	if iseven(nR)
		Int(div(R,10^(nR/2)))
	else
		Int((10^div(nR,2)-1))
	end
end

countIDs(v::Vector{Int64}) = countIDs(v[1],v[2])
function countIDs(RangeL,RangeR)
   counter = 0
   for i in firstHalfLeft(RangeL):firstHalfRight(RangeR)
       # temp = parse(Int,(string(i)*string(i)))
	   # i = 1234, temp  = 1234 * 10^4 + 1234
	   temp = Int(i*10^(trunc(log10(i))+1)+i)
	   counter += temp in RangeL:RangeR ? temp : 0
   end
   counter
end


end
