function is_in(ne_, ha_::AbstractSet)

    [ne in ha_ for ne in ne_]

end

function is_in(ne_id, ha_::AbstractVector)

    in_ = fill(false, length(ne_id))

    @inbounds @fastmath @simd for ha in ha_

        # TODO: Check
        id = get(ne_id, ha, nothing)

        if !isnothing(id)

            in_[id] = true

        end

    end

    in_

end
