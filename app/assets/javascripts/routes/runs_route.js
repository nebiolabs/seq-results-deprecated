BioProjects.RunsRoute = Ember.Route.extend({
  model: function() {
    return junk;
//    return BioProjects.Run.find();
  }
});

var junk = [{
  name: 'kevin'
}];