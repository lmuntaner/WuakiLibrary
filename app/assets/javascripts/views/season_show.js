Library.Views.SeasonShow = Backbone.View.extend({
	template: JST["library/season_show"],

	initialize: function (options) {
		this.listenTo(this.model, "sync add", this.render);
	},

	render: function () {
		var renderedContent = this.template({
			model: this.model
		});
		this.$el.html(renderedContent);

		return this;
	}
})
