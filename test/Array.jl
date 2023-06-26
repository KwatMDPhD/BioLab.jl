include("environment.jl")

# ---- #

for ar_ in (
    ([], [1]),
    ([1], [2, 3]),
    ([1, 2], [3 4]),
    ([1 2], [3, 4]),
    ([], [], [1]),
    ([1], [2], [3, 4]),
    ([1, 2], [3, 4], [5 6]),
    ([1 2], [3 4], [5, 6]),
)

    @test @is_error BioLab.Array.error_size_difference(ar_)

end

# ---- #

for ar_ in (
    ([], []),
    ([1], [2]),
    ([1, 2], [3, 4]),
    ([1 2], [3 4]),
    ([1 2; 3 4], [5 6; 7 8]),
    ([1 2 3; 4 5 6], [7 8 9; 10 11 12]),
    ([], [], []),
    ([1], [2], [3]),
    ([1, 2], [3, 4], [5, 6]),
    ([1 2], [3 4], [5 6]),
    ([1 2; 3 4], [5 6; 7 8], [9 10; 11 12]),
    ([1 2 3; 4 5 6], [7 8 9; 10 11 12], [13 14 15; 16 17 18]),
)

    @test !@is_error BioLab.Array.error_size_difference(ar_)

end
