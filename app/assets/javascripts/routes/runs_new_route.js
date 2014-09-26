SeqResults.RunsNewRoute = Ember.Route.extend({
  model: function () {
    return this.store.createRecord('run', {
      date: new Date()
    })
  },
  actions: {
    willTransition: function(transition) {
      var run = this.controller.get('model');
      if (run.get('isDirty')) {
        run.deleteRecord();
        run.save();
      }
    }
  }
});