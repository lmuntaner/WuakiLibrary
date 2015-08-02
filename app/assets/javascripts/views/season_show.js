Library.Views.SeasonShow = Backbone.View.extend({
	template: JST["library/season_show"],

	events: {
		"click .purchase": "purchaseSeason"
	},

	initialize: function (options) {
		this.listenTo(this.model, "sync add", this.render);
	},

	purchaseSeason: function (event) {
		event.preventDefault();
		var url = '/api/purchases';
		var purchase_params = {
			purchase_option_id: $(event.currentTarget).data('id')
		}
		$.ajax({
		  type: 'POST',
		  url: url,
			data: purchase_params,
		  success: function(purchase) {
				Backbone.history.navigate("my_library", { trigger: true });
		  },
		  error: function() {
				console.log('Some error!')
		  }
		});
	},

	render: function () {
		var renderedContent = this.template({
			model: this.model
		});
		this.$el.html(renderedContent);

		return this;
	}
})