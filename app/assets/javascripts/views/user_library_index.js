Library.Views.UserLibraryIndex = Backbone.View.extend({
	template: JST["library/user_index"],

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
