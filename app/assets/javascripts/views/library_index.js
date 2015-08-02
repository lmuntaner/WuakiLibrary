Library.Views.LibraryIndex = Backbone.View.extend({
	template: JST["library/index"],

	initialize: function (options) {
		this.listenTo(this.collection, "sync add", this.render);
	},

	render: function () {
		var renderedContent = this.template({
      collection: this.collection
    });
		this.$el.html(renderedContent);

		return this;
	}
})
