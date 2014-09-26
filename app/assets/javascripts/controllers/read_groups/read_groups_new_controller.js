SeqResults.ReadGroupsNewController = Ember.ObjectController.extend({
  needs: "run",
  run: Ember.computed.alias("controllers.run"),
  actions: {
    create: function(){
      this.model.save();
    }
  }
});