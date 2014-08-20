BioProjects.RunsNewController = Ember.ObjectController.extend({
  actions: {
    createRun: function(){
      this.get('model').save();
    }
  }
});