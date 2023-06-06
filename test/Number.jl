include("environment.jl")

# ---- #

for (nu, re) in (
    (-0, "0"),
    (0, "0"),
    (-0.0, "0"),
    (0.0, "0"),
    (1 / 3, "0.3333"),
    (0.1234567890123456789, "0.1235"),
    (0.001, "0.001"),
    (0.000001, "1e-06"),
)

    @test isequal(BioLab.Number.format(nu), re)

end

# ---- #

for (ra, re) in zip(
    0:28,
    (
        0.0,
        0.1,
        0.2,
        0.3,
        0.4,
        0.5,
        0.6,
        0.7,
        0.8,
        0.9,
        0.91,
        0.92,
        0.93,
        0.94,
        0.95,
        0.96,
        0.97,
        0.98,
        0.99,
        0.991,
        0.992,
        0.993,
        0.994,
        0.995,
        0.996,
        0.997,
        0.998,
        0.999,
        0.9991,
    ),
)

    @test BioLab.Number.rank_in_fraction(ra) == re

end
