BioProjects.RunController = Ember.ObjectController.extend({
  actions: {
    saveRun: function(){
      this.get('model').save();
    },
    deleteRun: function(){
      if (window.confirm("Are you sure you want to delete this run?")){
        this.get('model').deleteRecord();
        this.get('model').save();
        this.transitionToRoute('runs')
      }
    }
  }
});