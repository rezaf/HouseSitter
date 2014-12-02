HouseSitter.Views.ListingsForm = Backbone.View.extend({
  template: JST['listings/form'],

  events: {
    'submit': 'submit'
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var title = this.$('.listing-title-input').val();
    var params = {
      title: title,
      card_id: this.collection.card.id
    };
    this.collection.create(params, { wait: true });
    this.render();
  }
});
