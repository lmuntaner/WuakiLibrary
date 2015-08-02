Library.Routers.AppRouter = Backbone.Router.extend({
	routes: {
		"": "index",
		"my_library": "userLibrary",
		"items/:id": "showItem"
	},

	initialize: function (options) {
    this.$rootEl = options.container;
		this.userId = options.userId;
		this.collection = options.items;
		this.userLibrary = options.userItems;
	},

	index: function () {
		// this.collection.fetch();
		var indexView = new Library.Views.LibraryIndex({
			collection: this.collection
		});

    this._swapView(indexView);
	},

	showItem: function (itemId) {
    var item = this.collection.get(itemId);
		item.fetch();
		var itemShowView
		if (item.get('category') == "Movie") {
	    itemShowView = new Library.Views.MovieShow({
				model: item
			});
		} else {
			itemShowView = new Library.Views.SeasonShow({
				model: item
			});
		}

    this._swapView(itemShowView);
	},

	userLibrary: function () {
		// this.userLibrary.fetch();
		var userIndexView = new Library.Views.UserLibraryIndex({
			collection: this.userLibrary
		});

		this._swapView(userIndexView);
	},

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this.$rootEl.html(view.render().$el);
    this._currentView = view;
	}
})
