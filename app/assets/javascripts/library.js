window.Library = {
	Models: {},
	Collections: {},
	Views: {},
	Routers: {},
	initialize: function (options) {
		this.router = new Library.Routers.AppRouter(options);
		Backbone.history.start();
	}
};


Backbone.CompositeView = Backbone.View.extend({
  addSubview: function (selector, subview) {
    this.subviews(selector).push(subview);
    // Try to attach the subview. Render it as a convenience.
    this.attachSubview(selector, subview);
  },

  attachSubview: function (selector, subview) {
    this.$(selector).append(subview.render().$el);
    subview.delegateEvents();
  },

  attachSubviews: function () {
    var view = this;
    _(this.subviews()).each(function (subviews, selector) {
      view.$(selector).empty();
      _(subviews).each(function (subview) {
        view.attachSubview(selector, subview);
      });
    });
  },


	attachPrependSubview: function (selector, subview) {
		this.$(selector).prepend(subview.render().$el);
		subview.delegateEvents();
	},

	attachPrependSubviews: function () {
		var view = this;
		_(this.subviews()).each(function (subviews, selector) {
			view.$(selector).empty();
			_(subviews).each(function (subview) {
				view.attachPrependSubview(selector, subview);
			});
		});
	},

  remove: function () {
    Backbone.View.prototype.remove.call(this);
    _(this.subviews()).each(function (subviews) {
      _(subviews).each(function (subview) { subview.remove(); });
    });
  },

	resetSubviews: function () {
    _(this.subviews()).each(function (subviews) {
      _(subviews).each(function (subview) {
				subview.remove();
			});
    });
		this._subviews = {};
	},

  removeSubview: function (selector, subview) {
    subview.remove();

    var subviews = this.subviews(selector);
    subviews.splice(subviews.indexOf(subview), 1);
  },

  subviews: function (selector) {
    // Map of selectors to subviews that live inside that selector.
    // Optionally pass a selector and I'll initialize/return an array
    // of subviews for the sel.
    this._subviews = this._subviews || {};

    if (!selector) {
      return this._subviews;
    } else {
      this._subviews[selector] = this._subviews[selector] || [];
      return this._subviews[selector];
    }
  }
});
