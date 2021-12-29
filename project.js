//https://www.freeformatter.com/csv-to-json-converter.html#ad-output

function loadMapScenario() {
    // Adding bing maps to the web app
    let map = new Microsoft.Maps.Map(document.getElementById("column2"), { center: new Microsoft.Maps.Location(43.2557, -79.871),
    })

    // Adding Directions Module 
    Microsoft.Maps.loadModule('Microsoft.Maps.Directions', function() {
        directionsManager = new Microsoft.Maps.Directions.DirectionsManager(map)
    })
}