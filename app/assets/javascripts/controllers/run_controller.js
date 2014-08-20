BioProjects.RunController = Ember.ObjectController.extend({
  actions: {
    saveRun: function(){
      this.get('model').save()
    }
  }
});