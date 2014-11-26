window.HouseSitter = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    $rootEl: $("#main")
  },
  Backbone.history.start()
};

$(document).ready(function(){
  HouseSitter.initialize();
});
