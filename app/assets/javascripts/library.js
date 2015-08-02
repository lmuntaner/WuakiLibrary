window.Library = {
	Models: {},
	Collections: {},
	Views: {},
	Routers: {},
	initialize: function ($container) {
		new Library.Routers.AppRouter($container);
		Backbone.history.start();
	}
};

$(function () {
	var $container = $('.wuaki-library-container');
	Library.initialize({container: $container})
});
