HouseSitter.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl
  },

  routes: {
    "": "index"
  },

  index: function () {
    HouseSitter.Collections.listings.fetch();
    var indexView = new HouseSitter.Views.ListingsIndex({
      collection: HouseSitter.Collections.listings
    });
    this._swapView(indexView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
