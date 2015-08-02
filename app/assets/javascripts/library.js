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
