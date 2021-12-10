# https://timholy.github.io/Revise.jl/stable/config/
try
    @eval using Revise
catch e
    @warn "Error initializing Revise" exception=(e, catch_backtrace())
end
