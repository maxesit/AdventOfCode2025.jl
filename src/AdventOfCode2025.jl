module AdventOfCode2025

using Printf

solved_days = [1,2,3,4,9]
for day in solved_days
	include(joinpath(@__DIR__,"day"*lpad(string(day),2,"0")*".jl"))
end

function readInput(path::String)
    s = open(path, "r") do file
        read(file, String)
    end
    return s
end

export readInput

end # module AdventOfCode2025
