BioProjects.RunsNewController = Ember.ObjectController.extend({
  actions: {
    createRun: function(){
      this.get('model').save();
    },
    cancelRun: function(){
      this.get('model').destroyRecord();
      this.transitionToRoute('runs')
    }
  }
});