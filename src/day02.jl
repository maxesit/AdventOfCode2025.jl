module Day02

using AdventOfCode2025

function day02(input::String=readInput(joinpath(@__DIR__,"..","data","Day02","data-task1.txt")))
	task1 = sum(countIDs.(inputData(input)[:]))
	task2 = sum(countIDs2.(inputData(input)[:]))
	[task1,task2]
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

countIDs2(v::Vector{Int64}) = countIDs2(v[1],v[2])
function countIDs2(RangeL,RangeR)
	counter = 0
	for num in RangeL:RangeR
		nstr = string(num)
		n_digs = length(nstr)
		flag = false
		for len in 1:div(n_digs,2)
			if mod(n_digs,len)==0
				flag = true
			    for i in 1:len
          	    	flag *= all(isequal(first(nstr[i:len:end])),nstr[i:len:end])
		        	#println("num: ",nstr,":",nstr[i:len:end],"; ",flag)
				end
			end
			if flag==true
				#println("num: ",nstr,"| with len: ",len)
				break
			end
		end
		if flag == true
			counter += num
		end
	end
	counter 
end



#=	Idea for part 2:

1. loop from boundary to another

2. Check each number for repetition

=#





















end
