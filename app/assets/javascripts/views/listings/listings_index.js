HouseSitter.Views.ListingsIndex = Backbone.View.extend({

  template: JST['listings/index'],

  events: {
    'mouseover .show': 'toggleBounce',
  },

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  toggleBounce: function (event) {
    console.log(event);
    // if (marker.getAnimation() != null) {
    //   marker.setAnimation(null);
    // } else {
    //   marker.setAnimation(google.maps.Animation.BOUNCE);
    // }
  },

  setIcon: function (listOfLocationsForMarkers) {
    var myLatlng = new google.maps.LatLng(37.77, -122.42);
    var mapOptions = {
      zoom: 12,
      center: myLatlng
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    var infowindow = new google.maps.InfoWindow(), marker, i;

    for (var i = 0; i < listOfLocationsForMarkers.length; i++) {

      marker = new google.maps.Marker({
        position: new google.maps.LatLng(
          listOfLocationsForMarkers[i][1],
          listOfLocationsForMarkers[i][2]
        ),
        animation: google.maps.Animation.DROP,
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          var contentString = '<div id="content">' +
                                '<a href=#/listings/' +
                                  listOfLocationsForMarkers[i][3] +
                                '>' +
                                listOfLocationsForMarkers[i][0] +
                                '</a>' +
                              '</div>';

          infowindow.setContent(contentString);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
  },

  render: function () {
    var renderedContent = this.template({
      listings: this.collection
    });
    var that = this;
    var listOfLocationsForMarkers = [];

    this.collection.each(function(model) {
      var id = model.attributes.id;
      var title = model.attributes.title;
      var latitude = model.attributes.latitude;
      var longitude = model.attributes.longitude;
      if (!_.isNull(title) && !_.isNull(longitude)) {
        listOfLocationsForMarkers.push([title, latitude, longitude, id]);
      }
    });

    this.$el.html(renderedContent);
    return this;
  },
});
