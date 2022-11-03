function simulate(n, re = true, ra = OnePiece.Constant.RA; di = "Normal", mi = "")

    #
    if di == "Normal"

        di = Normal()

    else

        error()

    end

    #
    seed!(ra)

    ra_ = rand(di, n)

    #
    po_ = shift_minimum(ra_, 0)

    sort!(po_)

    ne_ = reverse(-po_)

    #
    if isempty(mi)

        nem_ = ne_

    elseif mi == "deep"

        nem_ = ne_ * 2.0

    elseif mi == "long"

        nem_ = Vector{eltype(ne_)}(undef, n * 2 - 1)

        for (id, ne) in enumerate(ne_)

            id2 = id * 2

            nem_[id2 - 1] = ne

            if id < n

                nem_[id2] = (ne + ne_[id + 1]) / 2

            end

        end

    else

        error()

    end

    #
    if !re

        nem_ = nem_[1:(end - 1)]

    end

    #
    vcat(nem_, po_)

end
