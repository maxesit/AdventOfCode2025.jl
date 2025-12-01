module Day01Task1

using AdventOfCode2025

function day01task1(input::String=readInput(joinpath(@__DIR__,"..","..","data","Day01","data-task1.txt")))
    decrypt(transformDirections(input))
end

function transformDirections(s::String)
    out = []
    for line in split(rstrip(s),"\n")
        line[1]=='L' ? push!(out,-parse(Int,line[2:end])) : push!(out,parse(Int,line[2:end]))
    end
    out
end

calcPassword(decrypted) = sum(decrypted.==0)

function decrypt(directions)
    ord = zeros(size(directions,1)+1)
    ord[1] = 50
    for i in 1:(size(directions,1))
        ord[i+1] = mod(ord[i] + directions[i],100)
    end
    calcPassword(ord)
end

end # module
