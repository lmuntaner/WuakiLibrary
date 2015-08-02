Library.Views.ItemShow = Backbone.View.extend({
	template: JST["library/item_show"],

	initialize: function (options) {
		this.listenTo(this.model, "sync add", this.render);
	},

	render: function () {
		var renderedContent = this.template();
		this.$el.html(renderedContent);

		return this;
	}
})
