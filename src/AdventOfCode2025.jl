module AdventOfCode2025

using Printf

include(joinpath(@__DIR__,"Day01","task1.jl"))

function readInput(path::String)
    s = open(path, "r") do file
        read(file, String)
    end
    return s
end

export readInput

end # module AdventOfCode2025
