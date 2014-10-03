SeqResults.ReadGroupsNewRoute = Ember.Route.extend({
  model: function() {
    var run_id =  this.modelFor('read_groups').get('query.run_id');
    return this.get('store').find('run', run_id);
  },
  actions: {
    willTransition: function(transition) {
      var read_group = this.controller.get('model');
      if (read_group.get('isDirty')) {
        read_group.deleteRecord();
        read_group.save();
      }
    }
  },
  setupController: function(controller, run) {
    var model = this.get('store').createRecord('readGroup',{run: run});
    this.controllerFor('run').set('model', run);
    this.controller.set('model', model);
  }
});