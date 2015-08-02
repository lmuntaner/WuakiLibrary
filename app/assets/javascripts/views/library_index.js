Library.Views.LibraryIndex = Backbone.CompositeView.extend({
	template: JST["library/index"],

	initialize: function (options) {
		this.createSubviews();
		this.listenTo(this.collection, "sync add", this.render);
	},

	createSubviews: function () {
		var view = this;
		this.collection.each(function (item) {
			var libraryItem = new Library.Views.LibraryItem({
				model: item
			});
			view.addSubview('div.list-group', libraryItem);
		})
	},

	render: function () {
		var renderedContent = this.template();
		this.$el.html(renderedContent);
		this.attachSubviews();

		return this;
	}
})
