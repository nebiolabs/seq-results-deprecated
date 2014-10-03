// For more information see: http://emberjs.com/guides/routing/

BioProjects.Router.map(function() {
  this.resource("projects", { path: '/' });

  this.resource("runs", { path: 'runs/:project_id' }, function() {
    this.resource("run", { path: "runs/:run_id"})
  });

  this.resource("read_groups", {path: 'runs/:run_id/read_groups'}, function(){
    this.resource("read_group", { path: "/:read_group_id"});
  });
});