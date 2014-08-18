BioProjects.Views.Table = function(el){
  this.$el = $(el);

  this.$thead = $('thead', this.$el);
  this.$tbody = $('tbody', this.$el);
  this.$tfooter = $('tfoot', this.$el);

  this.currentTableCollection = {};

  this.refreshTable = function(){
    this.currentTableCollection.getData()
  };

  _.bindAll(this, 'refreshTable');
};