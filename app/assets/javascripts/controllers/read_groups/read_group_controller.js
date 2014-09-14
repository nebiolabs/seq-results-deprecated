BioProjects.ReadGroupController = Ember.ObjectController.extend({

  actions: {
    save: function(){
      this.get('model').save();
    },
    delete: function(){
      if (window.confirm("Are you sure you want to delete this run?")){
        this.get('model').deleteRecord();
        this.get('model').save();
        this.transitionToRoute('readGroups.index')
      }
    },
    deleteModel: function(){
      if (window.confirm("Are you sure you want to delete the check associations?")){
        var checkedValues = $('input:checkbox:checked').map(function() {
          return $(this).attr('class');
        }).get();

        var readGroupID = this.get('model').id;
        $.ajax({
          url: '/read_groups/'+readGroupID+'/entity',
          type: 'POST',
          data: {'associations[]': checkedValues},
          context: this,
          success: function() {
            this.get('model').reload();
          },
          fail: function(){
          }
        })
      }
    }
  }
});