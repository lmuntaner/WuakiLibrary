Library.Collections.Items = Backbone.Collection.extend({
	url: "/api/libraries",
	model: Library.Models.Item
});
