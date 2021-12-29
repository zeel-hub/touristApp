function loadMapScenario() {
    let map = new Microsoft.Maps.Map(document.getElementById("column2"), { center: new Microsoft.Maps.Location(43.2557, -79.871),
    })

    Microsoft.Maps.loadModule('Microsoft.Maps.AutoSuggest', function() {
        var options = {
            maxResults: 4,
            map: map
        }
        var manager = new Microsoft.Maps.AutosuggestManager(options);
        manager.attachAutosuggest('#searchBox', '#searchBoxContainer', selectedSuggestion);
    })

    function selectedSuggestion(suggestionResult) {
        map.entities.clear();
        map.setView({ bounds: suggestionResult.bestView });
        var pushpin = new Microsoft.Maps.Pushpin(suggestionResult.location);
        map.entities.push(pushpin);
    }

    Microsoft.Maps.loadModule('Microsoft.Maps.Directions', function () {
        var directionsManager = new Microsoft.Maps.Directions.DirectionsManager(map);
        directionsManager.setRenderOptions({ itineraryContainer: document.getElementById('printoutPanel') })
        directionsManager.showInputPanel('panel')
    })

}