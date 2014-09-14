// For more information see: http://emberjs.com/guides/routing/

BioProjects.Router.map(function() {
  this.resource("runs", { path: '/' }, function() {
    this.resource("run", { path: "runs/:run_id"})
  });

  this.resource("read_groups", {path: 'runs/:run_id/read_groups'}, function(){
    this.resource("read_group", { path: "/:read_group_id"});
  });
});