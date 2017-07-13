function initialize() {
  
  var styles = [
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#263c3f"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6b9a76"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#38414e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#212a37"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9ca5b3"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#746855"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#1f2835"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#f3d19c"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2f3948"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#d59563"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#515c6d"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  }
]

  var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});
  
  var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);

  var xCordinate = 49.8076933
  var yCordinate = 23.9966193

  if (w > 640){
    zoomZoom = 16;
  } else {
    zoomZoom = 15;
  };
    
  var mapOptions = {
    zoom: zoomZoom,
    center: new google.maps.LatLng(xCordinate, yCordinate),
    panControl:false,
    zoomControl:true,
    mapTypeControl:false,
    scaleControl:false,
    streetViewControl:false,
    overviewMapControl:false,
    rotateControl:false,
    draggable: true,
    scrollwheel: false,
    mapTypeControlOptions:{
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, "map_style"]
    }
  };

  var map = new google.maps.Map(document.getElementById('googleMap'),
    mapOptions);

  var image = images.map_marker

  var marker = new google.maps.Marker({
    map: map,
    draggable: false,
    position: new google.maps.LatLng(xCordinate, yCordinate),
    icon: image
  });

  var infoWindow = new SnazzyInfoWindow({
      marker: marker,
      content:  '<div class="iw-header">'+
                  '<p>vr<span>cube</span></p>'+
                '</div>'+
                '<div class="iw-address">'+
                  '<p>вул. Княгині Ольги 114</p>'+
                  '<p>Львів, Україна</p><span>будівля “Аквапарку”</span>'+
                '</div>'
  }).open();

  map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');
}
google.maps.event.addDomListener(window, 'resize', initialize);
google.maps.event.addDomListener(window, 'load', initialize)