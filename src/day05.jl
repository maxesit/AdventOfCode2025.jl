module Day05

using AdventOfCode2025

function day05(input::String=readInput(joinpath(@__DIR__,"..","data","Day05","data-task1.txt")))
	task1 = countFresh(transformInput(input)[1],transformInput(input)[2])
	task2 = countTotalFresh(transformInput(input)[1])
	[task1,task2]
end

#any(number in r for r in fresh_list)

range_from_vec(v) = range(v[1],v[2])

function transformInput(s)
	fresh_list = []
	fresh, unknown = split(s,"\n\n")
	for ID_range in split(fresh,"\n")
		push!(fresh_list, range_from_vec(parse.(Int,split(ID_range,"-"))))
	end
	[fresh_list,unknown]
end

function countFresh(fresh_list,unknown)
	counter = 0
	for product in split(rstrip(unknown),"\n")
		counter += any((parse.(Int,product) in r) for r in fresh_list) ? 1 : 0
	end
	counter
end

# efficiently sorts and removes duplicates
function sortFreshList(fresh_list)
	out = unique(fresh_list)
	perms= sortperm(map(x->x[1],out))
	out = out[perms]
	for i in 2:size(out,1)
		if (out[i][1] == out[i-1][1])&&(out[i][end] < out[i-1][end])
			out[i], out[i-1] = out[i-1], out[i]
		end
	end
	out
end

function countTotalFresh(fresh_list)
	counter = 0
	sorted_list = sortFreshList(fresh_list)
	unsorted = true # looks for 1 clean run
	while unsorted
	unsorted = false
	for i in 2:size(sorted_list,1)
		if size(intersect(sorted_list[i],sorted_list[i-1]),1)!=0
			sorted_list[i] = sorted_list[i-1][1]:sorted_list[i][end]
			sorted_list[i-1] = sorted_list[i]
			unsorted = true
			counter+=1
			println(counter)
		end
	end
	sorted_list=unique(sorted_list)
	end
	return([sum(size.(sorted_list,1)),sorted_list])
end

end
