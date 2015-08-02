Library.Views.UserLibraryItem = Backbone.View.extend({
	template: JST["library/user_index_item"],
  tagName: 'a',
  className: 'list-group-item',

	initialize: function (options) {
    this.$el.attr('href', `#/items/${this.model.id}`);
		this.listenTo(this.model, "sync add", this.render);
	},

	render: function () {
		var purchasedDate = moment(this.model.get('created_at'));
		var expirationDate = purchasedDate.clone().add(2, 'days');
		var untilExpiration = moment.duration(expirationDate - purchasedDate);
		var icon = (this.model.get('category')) == 'Movie' ? 'ticket' : 'video-camera';
		var renderedContent = this.template({
      item: this.model,
			untilExpiration: untilExpiration,
			icon: icon
    });
		this.$el.html(renderedContent);

		return this;
	}
})
