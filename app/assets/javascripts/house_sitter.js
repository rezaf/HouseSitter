window.HouseSitter = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new HouseSitter.Routers.Router({
      $rootEl: $('#main')
    });
    Backbone.history.start();
  }
};
