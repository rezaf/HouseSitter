HouseSitter.Views.ListingShow = Backbone.View.extend({

  template: JST['listings/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render)
  },

  setIcon: function () {
    var myLatlng = new google.maps.LatLng(this.model.latitude, this.model.longitude);

    // To add the marker to the map, use the 'map' property
    var marker = new google.maps.Marker({
      position: myLatlng
    });
  },

  render: function () {
    var renderedContent = this.template({
      listing: this.model
    });
    this.$el.html(renderedContent);
    this.setIcon();
    return this;
  }
});
