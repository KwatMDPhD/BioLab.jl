module Evidence

using GLM: @formula, Binomial, glm, predict

using ..Nucleus

function fit(ta_, f1_)

    glm(@formula(ta_ ~ f1_), (; ta_, f1_), Binomial())

end

function plot(ht, ns, sa_, nt, ta_, nf, f1_, ge; marker_size = 4, layout = Dict{String, Any}())

    pr_ = predict(ge, (; f1_))

    id_ = sortperm(f1_)

    sa_ = sa_[id_]

    ta_ = ta_[id_]

    f1_ = f1_[id_]

    pr_ = pr_[id_]

    Nucleus.Plot.plot(
        ht,
        [
            Dict(
                "type" => "heatmap",
                "x" => sa_,
                "z" => [ta_],
                "colorscale" => Nucleus.Color.fractionate(Nucleus.Color.COBI),
                "colorbar" => Dict(
                    "y" => "0",
                    "yanchor" => "bottom",
                    "len" => 0.2,
                    "thickness" => 16,
                    "title" => nt,
                    "tickvals" => (0, 1),
                ),
            ),
            Dict(
                "yaxis" => "y2",
                "name" => "Feature",
                "x" => sa_,
                "y" => f1_,
                "mode" => "markers",
                "marker" => Dict("size" => marker_size, "color" => Nucleus.Color.HEBL),
                "cliponaxis" => false,
            ),
            Dict(
                "yaxis" => "y3",
                "name" => "0.5",
                "x" => sa_,
                "y" => fill(0.5, lastindex(f1_)),
                "mode" => "lines",
                "line" => Dict("color" => Nucleus.Color.HEFA),
            ),
            Dict(
                "yaxis" => "y3",
                "name" => "Probability",
                "x" => sa_,
                "y" => pr_,
                "mode" => "markers",
                "marker" => Dict(
                    "size" => marker_size * 0.8,
                    "color" => Nucleus.Color.color(pr_, Nucleus.Color.COBI),
                ),
                "cliponaxis" => false,
            ),
        ],
        Nucleus.Dict.merge(
            Dict(
                "yaxis" => Dict("domain" => (0, 0.04), "tickvals" => ()),
                "yaxis2" => Dict(
                    "domain" => (0.08, 1),
                    "anchor" => "free",
                    "position" => 0,
                    "range" => Nucleus.Collection.get_minimum_maximum(f1_),
                    "title" => Dict("text" => nf),
                    "zeroline" => false,
                    "showgrid" => false,
                ),
                "yaxis3" => Dict(
                    "domain" => (0.08, 1),
                    "anchor" => "free",
                    "position" => 0.08,
                    "overlaying" => "y2",
                    "title" => Dict("text" => "Probability"),
                    "range" => (0, 1),
                    "dtick" => 0.1,
                    "zeroline" => false,
                    "showgrid" => false,
                ),
                "xaxis" => Dict("domain" => (0.08, 1), "title" => Dict("text" => ns)),
            ),
            layout,
        ),
    )

end

end
