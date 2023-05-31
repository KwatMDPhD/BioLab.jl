include("environment.jl")

# ---- #

fr_ = (0.0, 0.001, 0.025, 0.05, 0.5, 0.95, 0.975, 0.999, 1.0)

# ---- #

for (cu, re) in zip(fr_, (-Inf, -3.09, -1.96, -1.64, 0.0, 1.64, 1.96, 3.09, Inf))

    @test isapprox(BioLab.Statistics.get_z_score(cu), re; atol = 0.01)

end

# ---- #

for (co, re) in zip(
    fr_,
    (
        (-0.0, 0.0),
        (-0.001253314465432556, 0.0012533144654324167),
        (-0.03133798202142661, 0.031337982021426465),
        (-0.06270677794321385, 0.06270677794321385),
        (-0.6744897501960818, 0.6744897501960818),
        (-1.9599639845400576, 1.9599639845400576),
        (-2.2414027276049495, 2.2414027276049517),
        (-3.290526731491899, 3.290526731491931),
        (-Inf, Inf),
    ),
)

    @test BioLab.Statistics.get_confidence_interval(co) == re

end
