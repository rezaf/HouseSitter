HouseSitter.Views.ListingsIndex = Backbone.View.extend({

  template: JST['listings/index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  setIcon: function (latitude, longitude) {
    var myLatlng = new google.maps.LatLng(latitude, longitude);
    var mapOptions = {
      zoom: 14,
      center: myLatlng
    }
    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    // To add the marker to the map, use the 'map' property
    var marker = new google.maps.Marker({
      position: myLatlng,
      map: map
    });
  },

  render: function () {
    var renderedContent = this.template({
      listings: this.collection
    });
    var that = this;
    this.collection.each(function(model) {
      var latitude = model.attributes.latitude;
      var longitude = model.attributes.longitude;
      if (!_.isNull(latitude) && !_.isNull(longitude)) {
        console.log(latitude);
        console.log(longitude);
        that.setIcon(latitude, longitude);
      }
    });
    this.$el.html(renderedContent);
    return this;
  }
});
