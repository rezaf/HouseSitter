HouseSitter.Collections.Listings = Backbone.Collection.extend({
  model: HouseSitter.Models.Listing,
  url: '/api/listings',

  getOrFetch: function (id) {
    var listing = this.get(id);
    var listings = this;

    if (!listing) {
      listing = new HouseSitter.Models.Listing({
        id: id
      });
      listing.fetch({
        success: function () {
          listings.add(listing);
        }
      });
    } else {
      listing.fetch();
    }
    return listing;
  }
});

HouseSitter.Collections.listings = new HouseSitter.Collections.Listings();
