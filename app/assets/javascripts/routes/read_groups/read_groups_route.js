SeqResults.ReadGroupsRoute = Ember.Route.extend({
  model: function(params) {
    var run = this.store.find('run', params['run_id']);
    this.set('run', run);
    return this.store.find('readGroup', params);
  },
  setupController: function(controller, model) {
    controller.set('run', this.get('run'));
    controller.set('model', model);
    controller.set('project_id', model.content[0]._data.project);
  }
});