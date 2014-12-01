HouseSitter.Views.ListingsIndex = Backbone.View.extend({

  template: JST['listings/index'],

  render: function() {
    var renderedContent = this.template({

    });
    this.$el.html(renderedContent);
    return this;
  }
});

HouseSitter.Views.ListingsMap = Backbone.View.extend({

  template: JST['listings/map'],

  loadScript: function () {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
    'callback=initialize';
    document.body.appendChild(script);
  }

  render: function() {
    var renderedContent = this.template({
      API_KEY: "AIzaSyAlgQ_SPQg1QnUHfbfpm-BJUy6N6A__U1M"
    });
    this.$el.html(renderedContent);
    return this;
  }
});

window.onload = loadScript;
