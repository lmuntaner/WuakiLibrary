Library.Routers.AppRouter = Backbone.Router.extend({
	routes: {
		"": "index",
		"my-library": "userLibrary",
		"items/:id": "showItem"
	},

	initialize: function (options) {
		this.collection = new Library.Collections.Items();
		this.collection.fetch();
    this.$rootEl = options.container;
	},

	index: function () {
		var indexView = new Library.Views.LibraryIndex({
			collection: this.collection
		});

    this._swapView(indexView);
	},

	userLibrary: function () {
	},

	showItem: function (itemId) {
    var item = this.collection.get(itemId);
    var itemShowView = new Library.Views.ItemShow();

    this._swapView(itemShowView);
	},

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this.$rootEl.html(view.render().$el);
    this._currentView = view;
	}
})
