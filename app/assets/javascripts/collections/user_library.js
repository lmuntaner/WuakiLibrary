Library.Collections.UserLibrary = Backbone.Collection.extend({
	model: Library.Models.Item,

  initialize: function (options) {
    this.url = `/api/libraries/${options.userId}`
  }
});
