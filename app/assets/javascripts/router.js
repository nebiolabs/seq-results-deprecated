// For more information see: http://emberjs.com/guides/routing/

BioProjects.Router.map(function() {
  this.resource("runs", function() {
    this.resource("run", {
      path: ":run_id"
    });
    this.route("new");
  });

  this.resource("readGroups", function() {

  });
});
