function hideAllTables(){
  $('#shearing-info-table').hide();
  $('#loading-info-table').hide();
  $('#library-prep-table').hide();
  $('#pcr-info-table').hide();
}

BioProjects.ReadGroupsController = Ember.ArrayController.extend({
  actions: {
    showLibraryPrep: function(){
      hideAllTables();
      $('#library-prep-table').show();
    },
    showShearingInfo: function(){
      hideAllTables();
      $('#shearing-info-table').show();
    },
    showPCRInfo: function(){
      hideAllTables();
      $('#pcr-info-table').show();
    },
    showLoadingInfo: function(){
      hideAllTables();
      $('#loading-info-table').show();
    }
  }
});