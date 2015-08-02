Library.Views.SeasonShow = Backbone.View.extend({
	template: JST["library/season_show"],

	events: {
		"click .purchase": "purchaseSeason"
	},

	initialize: function (options) {
		this.userLibrary = options.userLibrary;
		this.listenTo(this.model, "sync add", this.render);
	},

	purchaseSeason: function (event) {
		event.preventDefault();
		var url = '/api/purchases';
		var purchase_params = {
			purchase_option_id: $(event.currentTarget).data('id')
		}
		var view = this;
		$.ajax({
		  type: 'POST',
		  url: url,
			data: purchase_params,
		  success: function(purchase) {
				view.userLibrary.add(view.model)
				Backbone.history.navigate("my_library", { trigger: true });
		  },
		  error: function(response) {
				var errorMessage = response.responseJSON.errors.item[0];
				view.$('.purchase-error').show().text(errorMessage);
				view.$('.purchase').blur();
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
