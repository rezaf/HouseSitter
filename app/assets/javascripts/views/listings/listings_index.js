HouseSitter.Views.ListingsIndex = Backbone.View.extend({

  template: JST['listings/index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var renderedContent = this.template({
      listings: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }
});
