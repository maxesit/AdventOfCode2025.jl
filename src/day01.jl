module Day01

using AdventOfCode2025


function day01(input::String=readInput(joinpath(@__DIR__,"..","data","Day01","data-task1.txt")))
    task1 = calcPassword(decrypt(transformDirections(input))[1])
    _, task2 = clearPath(transformDirections(input))
    [task1 task2]
end

# maps string -> array of directions
function transformDirections(s::String)
    out = []
    for line in split(rstrip(s),"\n")
        line[1]=='L' ? push!(out,-parse(Int,line[2:end])) : push!(out,parse(Int,line[2:end]))
    end
    out
end

calcPassword(decrypted) = sum(decrypted.==0)

# maps directions -> array of positions mod 100
function decrypt(directions)
    ord = zeros(size(directions,1)+1)
    count = 0
    ord[1] = 50
    for i in 1:(size(directions,1))
        ord[i+1] = mod(ord[i] + directions[i],100)
    end
    [ord,count]
end

# returns how many times 0 is between x and y (mod 100)
# y is the state right after x
function metricMod100(y,x)
    out = 0
    x1 = div(x,100)-1*(x<0)*(mod(x,100)!=0)
    y1 = div(y,100)-1*(y<0)*(mod(y,100)!=0)
    if (mod(x,100)==0)&&(mod(y,100)==0)
        out = (x==y) ? 0 : abs(y1-x1)
    elseif (mod(x,100)==0)
        out = y<x ? abs(y1-x1)-1 : abs(y1-x1)
    elseif (mod(y,100)==0)
        out = y<x ? 1+abs(y1-x1) : abs(y1-x1)
    else
        out = (y==x) ? 0 : abs(y1-x1)
    end
    out
end

# calculates the path without using mod(.,100)
function clearPath(directions)
    ord = zeros(size(directions,1)+1)
    ord[1]=50
    count = 0
    for i in 1:(size(directions,1))
        ord[i+1] = ord[i]+directions[i]
        count+=metricMod100(ord[i+1],ord[i])
    end
    [ord,count]
end
end # module
