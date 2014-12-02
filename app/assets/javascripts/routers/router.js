HouseSitter.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl
  },

  routes: {
    "": "index",
    "listings/new": "new",
    "listings/:id": "show",
    "listings/:id/edit": "edit"
  },

  index: function () {
    HouseSitter.Collections.listings.fetch();
    var indexView = new HouseSitter.Views.ListingsIndex({
      collection: HouseSitter.Collections.listings
    });
    this._swapView(indexView);
  },

  new: function () {
    var newListing = new HouseSitter.Models.Listing();

    var formView = new HouseSitter.Views.ListingForm({
      collection: HouseSitter.Collections.listings,
      model: newListing
    });

    this._swapView(formView);
  },

  show: function (id) {
    var listing = HouseSitter.Collections.listings.getOrFetch(id);
    var formView = new HouseSitter.Views.ListingShow({ model: listing });
    this._swapView(formView);
  },

  edit: function (id) {
    var listing = HouseSitter.Collections.listings.getOrFetch(id);

    var formView = new HouseSitter.Views.ListingForm({
      model: listing,
      collection: HouseSitter.Collections.listings
    });

    this._swapView(formView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
