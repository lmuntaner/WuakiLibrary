Library.Views.UserLibraryIndex = Backbone.CompositeView.extend({
	template: JST["library/user_index"],

	initialize: function (options) {
		this.createSubviews();
		this.listenTo(this.collection, "sync add", this.render);
	},

	createSubviews: function () {
		var view = this;
		this.collection.each(function (item) {
			var userLibraryItem = new Library.Views.UserLibraryItem({
				model: item
			});
			view.addSubview('div.list-group', userLibraryItem);
		})
	},

	render: function () {
		var renderedContent = this.template();
		this.$el.html(renderedContent);
		this.attachSubviews();

		return this;
	}
})
