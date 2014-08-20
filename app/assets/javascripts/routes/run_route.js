BioProjects.RunRoute = Ember.Route.extend({
  setupController: function(controller, run) {
    controller.set('model', run);
  }
});