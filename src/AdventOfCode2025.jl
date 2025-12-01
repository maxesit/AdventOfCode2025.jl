module AdventOfCode2025

using Printf

include(joinpath(@__DIR__,"day01.jl"))

function readInput(path::String)
    s = open(path, "r") do file
        read(file, String)
    end
    return s
end

export readInput

end # module AdventOfCode2025
