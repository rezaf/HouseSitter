HouseSitter.Views.ListingsForm = Backbone.View.extend({
  tagName: 'form',
  template: JST['listings/form'],

  events: {
    'click button': 'submit',
    'click #image-upload': 'upload'
  },

  initialize: function () {
    $("#create-listing").on("click", this.render());
  },

  render: function () {
    var renderedContent = this.template({
      listing: this.model
    });
    this.$el.html(renderedContent);
    return this;
  },

  upload: function () {
    filepicker.pick(function(blob) {
      this.model.set({ image: blob.url })
    }.bind(this));
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    attrs.address = attrs['address-field'];
    attrs.coordinates = codeAddress(attrs.address);
    var that = this;

    this.model.save(attrs, {
      success: function () {
        that.collection.add(that.model, { merge: true });
        Backbone.history.navigate("", { trigger: true });
      },
      error: function (model, response, options) {
        that.model.errors = response.responseJSON.join(". ").concat(".");
        that.render();
      }
    });
  }
});
