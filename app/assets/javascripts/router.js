// For more information see: http://emberjs.com/guides/routing/

BioProjects.Router.map(function() {
  this.resource("runs", { path: '/' }, function() {
    this.resource("run", { path: "runs/:run_id"})
  });

  this.resource("read_groups", {path: 'runs/:run_id/read_groups'}, function(){
//    this.route('library_prep', function(){
//      this.resource("library_prep_edit", { path: "/:read_group_id/library_prep" });
//    });
//    this.route('shearing_info', function(){
//      this.resource("shearing_info_edit", { path: "/:read_group_id/shearing_info"});
//    });
//    this.route('pcr_info', function(){
//      this.resource("pcr_info_edit", { path: "/:read_group_id/pcr_info"});
//    });
//    this.route('loading_info', function(){
//      this.resource("loading_info_edit", { path: "/:read_group_id/loading_info"});
//    });
    this.resource("read_group", { path: "/:read_group_id"});
  });
});