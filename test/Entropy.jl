using Omics

using Test: @test

# ----------------------------------------------------------------------------------------------- #

# ---- #

for (pr_, re) in (
    ([1], 0.0),
    ([0.001, 0.999], 0.011407757737461138),
    ([0.01, 0.99], 0.08079313589591118),
    ([0.1, 0.9], 0.4689955935892812),
    ([0.2, 0.8], 0.7219280948873623),
    ([0.3, 0.7], 0.8812908992306927),
    ([0.4, 0.6], 0.9709505944546686),
    ([0.5, 0.5], 1.0),
    ([1 / 3, 1 / 3, 1 / 3], 1.584962500721156),
    ([0.25, 0.25, 0.25, 0.25], 2.0),
    ([0.2, 0.2, 0.2, 0.2, 0.2], 2.321928094887362),
    ([0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1], 3.321928094887362),
    ([0.05, 0.15, 0.05, 0.15, 0.05, 0.15, 0.05, 0.15, 0.05, 0.15], 3.133206219346495),
    ([0.01, 0.19, 0.02, 0.18, 0.03, 0.17, 0.04, 0.16, 0.05, 0.15], 2.901615909840989),
)

    @test Omics.Entropy.ge(pr_) === re

    # 5.833 ns (0 allocations: 0 bytes)
    # 10.511 ns (0 allocations: 0 bytes)
    # 10.511 ns (0 allocations: 0 bytes)
    # 11.887 ns (0 allocations: 0 bytes)
    # 11.887 ns (0 allocations: 0 bytes)
    # 11.887 ns (0 allocations: 0 bytes)
    # 11.887 ns (0 allocations: 0 bytes)
    # 11.887 ns (0 allocations: 0 bytes)
    # 16.992 ns (0 allocations: 0 bytes)
    # 22.107 ns (0 allocations: 0 bytes)
    # 27.066 ns (0 allocations: 0 bytes)
    # 52.558 ns (0 allocations: 0 bytes)
    # 52.569 ns (0 allocations: 0 bytes)
    # 52.612 ns (0 allocations: 0 bytes)
    @btime Omics.Entropy.ge($pr_)

end

# ---- #

const JO = [
    1/8 1/16 1/16 1/4
    1/16 1/8 1/16 0
    1/32 1/32 1/16 0
    1/32 1/32 1/16 0
]

for (ea, re) in ((eachrow, 7 / 4), (eachcol, 2.0))

    @test Omics.Entropy.ge(ea, JO) === re

    # 37.550 ns (0 allocations: 0 bytes)
    # 32.612 ns (0 allocations: 0 bytes)
    @btime Omics.Entropy.ge($ea, JO)

end
