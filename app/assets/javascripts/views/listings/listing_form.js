HouseSitter.Views.ListingsForm = Backbone.View.extend({
  tagName: 'form',
  template: JST['listings/form'],

  events: {
    'click button': 'submit'
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
      var newImage = new HouseSitter.Models.Listing({
        image: blob.url
      });
      newImage.save({}, {
        success: function () {
          alert('Image saved!');
        }
      })
    });
  }

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    attrs.address = attrs['address-field']
    that = this;

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
