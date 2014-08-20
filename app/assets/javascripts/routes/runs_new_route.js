BioProjects.RunsNewRoute = Ember.Route.extend({
  model: function () {
    return this.store.createRecord('run', {
      date: new Date()
    })
  },
  setupController: function(controller, model) {
    controller.set('model', model);
  }
});