BioProjects.ReadGroupsRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('run', params.run_id).then(function(run){
      return run.get('readGroups');
    });
  }
});