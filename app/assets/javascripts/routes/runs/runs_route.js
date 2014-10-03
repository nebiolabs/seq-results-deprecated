BioProjects.RunsRoute = Ember.Route.extend({
  model: function(params) {
    var project_id = params.project_id;
    this.set('project_id', project_id);
    return this.store.find('run', { project_id: project_id });
  },
  setupController: function(controller, model) {
    controller.set('project_id', this.get('project_id'));
    controller.set('model', model);
  }
});
