BioProjects.RunsRoute = Ember.Route.extend({
  model: function() {
    return this.get('store').findAll('run');
  },
  setupController: function(controller, model) {
    controller.set('model', model);
  }
});
