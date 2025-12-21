module Day06

using AdventOfCode2025

function day06(input::String=readInput(joinpath(@__DIR__,"..","data","Day06","data-task1.txt")))
	task1 = solveHomework(transformInput(input))
	task2 = -1
	[Int(task1),task2]
end

function transformInput(s)
	temp = []
	for line in split(rstrip(s),"\n")
		push!(temp,line)
	end
	problem_length = size(temp,1)
	out = zeros(1,problem_length) # a1 a2 a3 ... an m | m=1 for +, m=2 for *
	# First pass
	for num in split(temp[1])
		ftemp = zeros(1,problem_length)
		ftemp[1] = parse(Int,num)
		out = vcat(out,ftemp)
	end
	# Other passes
	for i in 2:(problem_length-1)
		j = 2 
		for num in split(temp[i])
			out[j,i] = parse(Int,num)
			j+=1
		end
	end
	# Last pass
	j = 2
	for sgn in split(temp[end])
		out[j,end] = (sgn=="+") ? 1 : 2 
		j+=1
	end
	out
end

function solveHomework(prob_table)
	prob_count, _ = size(prob_table)
	out = 0
	for prob_nr in 2:prob_count
		out += (prob_table[prob_nr,end] == 1) ? sum(prob_table[prob_nr,1:(end-1)]) : prod(prob_table[prob_nr,1:(end-1)])
	end
	out
end

end
