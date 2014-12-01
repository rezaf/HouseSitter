HouseSitter.Views.ListingsIndex = Backbone.View.extend({

  template: JST['listings/index'],

  render: function () {
    var renderedContent = this.template({

    });
    this.$el.html(renderedContent);
    return this;
  }
});
