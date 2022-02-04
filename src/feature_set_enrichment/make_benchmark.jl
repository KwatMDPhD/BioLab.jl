function make_benchmark(id::String)::Tuple{Vector{String},Vector{Float64},Vector{String}}

    sp_ = split(id)

    if sp_[1] == "card"

        fe_ = string.(ConstantExtension.CARD)

        n_fe = length(fe_) / 2

        sc_ = Base.convert(Vector{Float64}, ceil(-n_fe):floor(n_fe))

        fe1_ = string.(collect(sp_[2]))

        if !all(fe1 in fe_ for fe1 in fe1_)

            error("not all cards are in the cards.")

        end

    elseif sp_[1] == "random"

        fe_ = [string("Feature ", id) for id = 1:parse(Int64, sp_[2])]

        ve = randn(Base.convert(Int64, length(fe_) / 2))

        sc_ = sort([.-ve; ve])

        fe1_ = sample(fe_, parse(Int64, sp_[3]); replace = false)

    elseif sp_[1] == "myc"

        di = joinpath("..", "test", "data", "")

        da = TableAccess.read(joinpath(di, "gene_score.tsv"))

        fe_ = da[!, "Gene"]

        sc_ = da[!, "Score"]

        fe1_ =
            GMTAccess.read(joinpath(di, "c2.all.v7.1.symbols.gmt"))["COLLER_MYC_TARGETS_UP"]

    end

    return fe_, sc_, fe1_

end