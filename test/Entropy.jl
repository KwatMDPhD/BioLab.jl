using Omics

using Test: @test

# ----------------------------------------------------------------------------------------------- #

# ---- #

# 2.375 ns (0 allocations: 0 bytes)
# 6.417 ns (0 allocations: 0 bytes)
# 6.458 ns (0 allocations: 0 bytes)
# 6.417 ns (0 allocations: 0 bytes)
# 6.417 ns (0 allocations: 0 bytes)
# 6.458 ns (0 allocations: 0 bytes)
# 5.166 ns (0 allocations: 0 bytes)
for (pr, re) in (
    (0, 0.0),
    (0.03125, 0.15625),
    (0.0625, 0.25),
    (0.125, 0.375),
    (0.25, 0.5),
    (0.5, 0.5),
    (1, -0.0),
)

    @test Omics.Entropy.ge(pr) === re

    #@btime Omics.Entropy.ge($pr)

end

# ---- #

for (pr_, re) in (
    # 2
    ([0.001, 0.999], 0.011407757737461138),
    ([0.01, 0.99], 0.08079313589591118),
    ([0.1, 0.9], 0.4689955935892812),
    ([0.2, 0.8], 0.7219280948873623),
    ([0.3, 0.7], 0.8812908992306927),
    ([0.4, 0.6], 0.9709505944546686),
    ([0.5, 0.5], 1.0),
    # 3, 4, 5
    ([1 / 3, 1 / 3, 1 / 3], 1.584962500721156),
    ([0.25, 0.25, 0.25, 0.25], 2.0),
    ([0.2, 0.2, 0.2, 0.2, 0.2], 2.321928094887362),
    # 10
    ([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1], 3.321928094887362),
    ([0.05, 0.15, 0.05, 0.15, 0.05, 0.15, 0.05, 0.15, 0.05, 0.15], 3.133206219346495),
    ([0.01, 0.19, 0.02, 0.18, 0.03, 0.17, 0.04, 0.16, 0.05, 0.15], 2.901615909840989),
)

    @test sum(Omics.Entropy.ge, pr_) === re

    # TODO: Plot.

end

# ---- #

const JO = [
    0.0 0.0416667 0.0833333 0.125
    0.125 0.0 0.0416667 0.0833333
    0.0833333 0.125 0.0 0.0416667
    0.0416667 0.0833333 0.125 0.0
]

# 37.970 ns (0 allocations: 0 bytes)
# 33.451 ns (0 allocations: 0 bytes)
for ea in (eachrow, eachcol)

    @test Omics.Entropy.ge(ea, JO) === 2.0

    #@btime Omics.Entropy.ge($ea, JO)

end