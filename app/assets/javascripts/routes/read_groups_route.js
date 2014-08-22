BioProjects.ReadGroupsRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('readGroup', params);
  }
});