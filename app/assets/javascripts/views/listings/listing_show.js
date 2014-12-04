HouseSitter.Views.ListingShow = Backbone.View.extend({

  template: JST['listings/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
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
      map: map,
      title:"Hello World!"
    });
  },

  render: function () {
    var renderedContent = this.template({
      listing: this.model
    });
    this.$el.html(renderedContent);
    var latitude = this.model.attributes.latitude;
    var longitude = this.model.attributes.longitude;
    if (latitude && longitude) {
      this.setIcon(latitude, longitude);
    }
    return this;
  }
});
