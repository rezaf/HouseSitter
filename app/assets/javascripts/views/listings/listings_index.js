HouseSitter.Views.ListingsIndex = Backbone.View.extend({

  template: JST['listings/index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  setIcon: function (listOfLocationsForMarkers) {
    var myLatlng = new google.maps.LatLng(37.77, -122.42);
    var mapOptions = {
      zoom: 14,
      center: myLatlng
    }
    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    var infowindow = new google.maps.InfoWindow(), marker, i;

    for (var i = 0; i < listOfLocationsForMarkers.length; i++) {
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(
          listOfLocationsForMarkers[i][1],
          listOfLocationsForMarkers[i][2]),
        map: map
      });
      google.maps.event.addListener(listOfLocationsForMarkers,
        'click', (function(marker, i) {
        return function() {
          infowindow.setContent(listOfLocationsForMarkers[i][0]);
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
      var title = model.attributes.title;
      var latitude = model.attributes.latitude;
      var longitude = model.attributes.longitude;
      if (!_.isNull(title) && !_.isNull(longitude)) {
        listOfLocationsForMarkers.push([title, latitude, longitude]);
      }
    });
    this.setIcon(listOfLocationsForMarkers);
    this.$el.html(renderedContent);
    return this;
  }
});
