function hideAllTables(){
  $('table').hide();
}

BioProjects.ReadGroupsController = Ember.ArrayController.extend({
  actions: {
    showTable: function(el) {
      hideAllTables();
      $(el).show();
    }
  }
});