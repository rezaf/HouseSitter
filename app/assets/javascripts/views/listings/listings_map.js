HouseSitter.Views.ListingsMap = Backbone.View.extend({

  template: JST['listings/map'],

  render: function() {
    var renderedContent = this.template({

    });
    this.$el.html(renderedContent);
    return this;
  }
});


API_KEY: "AIzaSyAlgQ_SPQg1QnUHfbfpm-BJUy6N6A__U1M"

function initialize() {
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644)
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
  mapOptions);
}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
  'callback=initialize';
  document.body.appendChild(script);
}

window.onload = loadScript;

google.maps.event.addDomListener(window, 'load', initialize);
