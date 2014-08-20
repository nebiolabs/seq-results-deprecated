BioProjects.RunController = Ember.ObjectController.extend({
  actions: {
    saveRun: function(){
      this.get('model').save();
    },
    deleteRun: function(){
      this.get('model').deleteRecord();
      this.get('model').save();
      this.transitionToRoute('runs')
    }
  }
});