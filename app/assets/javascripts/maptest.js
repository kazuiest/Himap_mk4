var map;

function initialize() {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map_canvas"));
    map.setCenter(new GLatLng(41.782737,140.738897), 13);

    GEvent.addListener(map, "click", clickAction);
  }
}

function downloadData(){
  GDownloadUrl("data.xml", function dispData(data, statusCode){
    var xml = GXml.parse(data);
    var markers = xml.documentElement.getElementsByTagName("marker");

    for (var i = 0; i < markers.length; i++) {
      var lats = markers[i].getElementsByTagName("lat");
      var lngs = markers[i].getElementsByTagName("lng");
      var names = markers[i].getElementsByTagName("name");

      var lat = parseFloat(GXml.value(lats[0]));
      var lng = parseFloat(GXml.value(lngs[0]));
      var name = GXml.value(names[0]);

      map.addOverlay(createMarker(lat, lng, name));
    }
  });
}

function createMarker(lat, lng, name) {
  var marker = new GMarker(new GLatLng(lat, lng));

  var html = "<p>" + name + "</p>";
  GEvent.addListener(marker, "click", function(){
    marker.openInfoWindowHtml(html);
  });

  return marker;
}