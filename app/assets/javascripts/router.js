// For more information see: http://emberjs.com/guides/routing/

BioProjects.Router.map(function() {
  this.resource("runs", function() {
    this.resource("run", {
      path: ":run_id"
    });
  });

  this.resource("readGroups", function() {

  });
//  return this.resource('makes', function() {
//    this.route('new');
//    this.route('edit', {
//      path: '/:make_id/edit'
//    });
//    return this.route('show', {
//      path: '/:make_id'
//    });
//  });
});
