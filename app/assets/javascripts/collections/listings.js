HouseSitter.Collections.Listings = Backbone.Collection.extend({

  model: HouseSitter.Models.Listing,
  url: '/api/listings'

});

HouseSitter.Collections.listings = new HouseSitter.Collections.Listings();
