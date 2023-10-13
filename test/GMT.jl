using Test: @test

using BioLab

# ---- #

const DA = joinpath(BioLab._DA, "GMT")

# ---- #

@test BioLab.Path.read(DA) == ["c2.all.v7.1.symbols.gmt", "h.all.v7.1.symbols.gmt"]

# ---- #

for (gm, re) in (("h.all.v7.1.symbols.gmt", 50), ("c2.all.v7.1.symbols.gmt", 5529))

    gm = joinpath(DA, gm)

    @test length(BioLab.GMT.read(gm)) === re

    # 350.416 μs (7717 allocations: 974.86 KiB)
    # 26.849 ms (515903 allocations: 51.28 MiB)
    @btime BioLab.GMT.read($gm)

end
