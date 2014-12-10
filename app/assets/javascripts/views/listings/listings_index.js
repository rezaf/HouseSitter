HouseSitter.Views.ListingsIndex = Backbone.View.extend({

  template: JST['listings/index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  setIcon: function (listOfLocationsForMarkers) {
    var myLatlng = new google.maps.LatLng(37.77, -122.42);
    var mapOptions = {
      zoom: 12,
      center: myLatlng
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    var infowindow = new google.maps.InfoWindow(), marker, i;

    for (i = 0; i < listOfLocationsForMarkers.length; i++) {
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(
          listOfLocationsForMarkers[i][1],
          listOfLocationsForMarkers[i][2]
        ),
        animation: google.maps.Animation.DROP,
        map: map
      });

      $('.listings').hover(
        function() {
          alert("here");
          // marker.setAnimation(google.maps.Animation.BOUNCE);
        }, function() {
          // marker.setAnimation(null);
        }
      );

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
    this.setIcon(listOfLocationsForMarkers);
    this.$el.html(renderedContent);
    return this;
  }
});
