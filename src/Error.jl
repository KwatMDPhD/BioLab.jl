module Error

using BioLab

macro is_error(ex)

    exe = esc(ex)

    quote

        try

            $exe

            false

        catch er

            @info "Errored." er

            true

        end

    end

end

function error_has_key(ke_va, ke)

    if haskey(ke_va, ke)

        va = ke_va[ke]

        error("$ke (=> $va) exists.")

    end

end

function error_duplicate(co)

    if isempty(co)

        error("Is empty.")

    end

    if !allunique(co)

        n_nos = BioLab.String.count(length(an_n), "duplicate")

        st = BioLab.Collection.count_sort_string(co, 2)

        error("Found $n_nos.\n$st")

    end

end

function error_bad(co)

    id_ = findall(BioLab.Bad.is, co)

    if !isempty(id_)

        n_nos = BioLab.String.count(length(id_), "bad value")

        st = join(unique(co[id_]), ".\n")

        error("Found $n_nos.\n$st.")

    end

end

function error_missing(pa)

    if !ispath(pa)

        error("$pa is missing.")

    end

end

function error_extension_difference(pa, ex2)

    ex = chop(splitext(pa)[2]; head = 1, tail = 0)

    if ex != ex2

        error("Extensions differ. $ex != $ex2.")

    end

end

end
