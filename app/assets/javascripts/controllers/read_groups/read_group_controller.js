SeqResults.ReadGroupController = Ember.ObjectController.extend({
  actions: {
    save: function(){
      this.get('model').save();
    },
    delete: function(){
      if (window.confirm("Are you sure you want to delete this run?")){
        this.get('model').deleteRecord();
        this.get('model').save();
        this.transitionToRoute('readGroups.index')
      }
    }
  }
});