Library.Routers.AppRouter = Backbone.Router.extend({
	routes: {
		"": "index",
		"my_library": "userLibrary",
		"items/:id": "showItem"
	},

	initialize: function (options) {
		this.collection = new Library.Collections.Items();
		this.collection.fetch();
    this.$rootEl = options.container;
		this.userId = options.userId;
	},

	index: function () {
		var indexView = new Library.Views.LibraryIndex({
			collection: this.collection
		});

    this._swapView(indexView);
	},

	userLibrary: function () {
		var userLibrary = new Library.Collections.UserLibrary({
			userId: this.userId
		})
		userLibrary.fetch();
		var userIndexView = new Library.Views.UserLibraryIndex({
			collection: userLibrary
		});

		this._swapView(userIndexView);
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

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this.$rootEl.html(view.render().$el);
    this._currentView = view;
	}
})
