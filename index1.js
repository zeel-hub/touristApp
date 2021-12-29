function loadMapScenario() {
    let map = new Microsoft.Maps.Map(document.getElementById("column2"), { center: new Microsoft.Maps.Location(43.2557, -79.871),
    })

    $("#waterfalls").click(function() {
        removePushPins()
        var places = []
        for (i = 0; i < waterfalls.length; i++) {
            displayPushpins(waterfalls)
            places.push("<li>"+ waterfalls[i].NAME +"</li>")
        }
        document.getElementById("panel").innerHTML = places.join('')
        $("#panel").css("text-align","left")
    })

    $("#museums").click(function() {
        removePushPins()
        var places = []
        for (i = 0; i < museums.length; i++) {
            displayPushpins(museums)
            places.push("<li>"+ museums[i].NAME +"</li>")
        }
        document.getElementById("panel").innerHTML = places.join('')
        $("#panel").css("text-align","left")
    })

    $("#beaches").click(function() {
        removePushPins()
        var places = []
        for (i = 0; i < beaches.length; i++) {
            displayPushpins(beaches)
            places.push("<li>"+ beaches[i].NAME +"</li>")
        }
        document.getElementById("panel").innerHTML = places.join('')
        $("#panel").css("text-align","left")
    })

    function displayPushpins(place) {
        let location = new Microsoft.Maps.Location(
            place[i].LATITUDE,
            place[i].LONGITUDE
        )

        // accessing each associate array element
        pushpin = new Microsoft.Maps.Pushpin(location, {
            title: place[i].NAME,
        })
        pushpin.metadata = {
            myTitle: place[i].NAME
        }

        map.entities.push(pushpin)
    }

    function removePushPins() {
        for (let i = map.entities.getLength() - 1; i >= 0; i--)
        {
            let pushpin = map.entities.get(i)
            if (pushpin instanceof Microsoft.Maps.Pushpin)
                map.entities.removeAt(i)
        }
    }

}