SeqResults.RunsNewController = Ember.ObjectController.extend({
  actions: {
    create: function(){
      this.get('model').save();
    }
  }
});