module AdventOfCode2025

using Printf

include(joinpath(@__DIR__,"day01.jl"))
include(joinpath(@__DIR__,"day02.jl"))
include(joinpath(@__DIR__,"day09.jl"))
include(joinpath(@__DIR__,"day03.jl"))

function readInput(path::String)
    s = open(path, "r") do file
        read(file, String)
    end
    return s
end

export readInput

end # module AdventOfCode2025
