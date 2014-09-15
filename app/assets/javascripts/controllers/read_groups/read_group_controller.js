BioProjects.ReadGroupController = Ember.ObjectController.extend({

  actions: {
    save: function(){
      var $saveButton = $('.edit-model');
      $saveButton.css("background-color", "#CEEACE");
      $saveButton.html("Saving");

      this.get('model').save().then(function(){
        $saveButton.css("background-color", '#5cb85c');
        $saveButton.html("Done");
      });
    },
    delete: function(){
      if (window.confirm("Are you sure you want to delete this run?")){
        this.get('model').deleteRecord();
        this.get('model').save();
        this.transitionToRoute('readGroups.index')
      }
    },
    deleteModels: function(){
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