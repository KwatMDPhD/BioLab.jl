function plot(el_, st_, la, ou = "")

    di = "plot"

    sr_ = [
        "https://cdnjs.cloudflare.com/ajax/libs/cytoscape/3.21.1/cytoscape.min.js",
        "http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js",
        "https://cdn.rawgit.com/eligrey/FileSaver.js/master/dist/FileSaver.js",
    ]

    pn = "$(splitext(basename(ou))[1]).png"

    sc = """
    var cy = cytoscape({

        container: document.getElementById("$di"),

        elements: $(JSON3.write(el_)),

        style: $(JSON3.write(st_)),

        layout: $(JSON3.write(la)),

    })

    cy.ready(function () {

        var png = cy.png({"full":true, "scale":2});

        saveAs(png, "$pn")

    })

    """

    OnePiece.html.make(di, sr_, sc, ou)

end
