function plot(
    wm_,
    hm_;
    nar_ = ["Rows $id" for id in 1:length(wm_)],
    nac_ = ["Columns $id" for id in 1:length(wm_)],
    naf = "Factor",
    _ro_ = [["$na $id" for id in 1:size(wm, 1)] for (wm, na) in zip(wm_, nar_)],
    _co_ = [["$na $id" for id in 1:size(hm, 2)] for (hm, na) in zip(hm_, nar_)],
    ou = "",
)

    fa_ = ["$naf $id" for id in 1:size(wm_[1], 2)]

    sh = 720

    lo = sh * MathConstants.golden

    axis = Dict("dtick" => 1)

    for (id, (wm, ro_, nar)) in enumerate(zip(wm_, _ro_, nar_))

        or_ = OnePiece.clustering.cluster(wm)[1]

        title_text = "W $id"

        if isempty(ou)

            ou2 = ou

        else

            ou2 = joinpath(ou, "$title_text.html")

        end

        display(
            OnePiece.figure.plot_heat_map(
                replace(OnePiece.normalization.normalize!(wm[or_, :], 1, "-0-"), NaN => nothing),
                y = ro_[or_],
                x = fa_,
                na1 = nar,
                na2 = naf,
                layout = Dict(
                    "height" => lo,
                    "width" => sh,
                    "title" => Dict("text" => title_text),
                    "xaxis" => axis,
                ),
                ou = ou2,
            ),
        )

    end

    for (id, (hm, co_, nac)) in enumerate(zip(hm_, _co_, nac_))

        or_ = OnePiece.clustering.cluster(transpose(hm))[1]

        title_text = "H $id"

        if isempty(ou)

            ou2 = ou

        else

            ou2 = joinpath(ou, "$title_text.html")

        end

        display(
            OnePiece.figure.plot_heat_map(
                OnePiece.normalization.normalize!(hm[:, or_], 2, "-0-"),
                y = fa_,
                x = co_[or_],
                na1 = naf,
                na2 = nac,
                layout = Dict(
                    "height" => sh,
                    "width" => lo,
                    "title" => Dict("text" => title_text),
                    "yaxis" => axis,
                ),
                ou = ou2,
            ),
        )

    end

end
