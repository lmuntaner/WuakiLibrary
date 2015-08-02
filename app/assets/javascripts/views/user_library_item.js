Library.Views.UserLibraryItem = Backbone.View.extend({
	template: JST["library/user_index_item"],
  tagName: 'a',
  className: 'list-group-item',

	initialize: function (options) {
    this.$el.attr('href', `#/items/${this.model.id}`);
		this.listenTo(this.model, "sync add", this.render);
	},

	render: function () {
		var renderedContent = this.template({
      item: this.model
    });
		this.$el.html(renderedContent);

		return this;
	}
})
