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
    $("#back-btn").remove();
    HouseSitter.Collections.listings.fetch();
    var indexView = new HouseSitter.Views.ListingsIndex({
      collection: HouseSitter.Collections.listings
    });
    this._swapView(indexView);
  },

  new: function () {
    var newListing = new HouseSitter.Models.Listing();

    var formView = new HouseSitter.Views.ListingsForm({
      collection: HouseSitter.Collections.listings,
      model: newListing
    });

    this._swapView(formView);
  },

  show: function (id) {
    $('#new_listing_btn').append('<a class="btn btn-success" id="back-btn" href="#/">Back</a>');
    var listing = HouseSitter.Collections.listings.getOrFetch(id);
    var formView = new HouseSitter.Views.ListingShow({ model: listing });
    this._swapView(formView);
  },

  edit: function (id) {
    var listing = HouseSitter.Collections.listings.getOrFetch(id);

    var formView = new HouseSitter.Views.ListingsForm({
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
