BioProjects.ReadGroupController = Ember.ObjectController.extend({

  queryParams: ['form'],
  form: null,

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
    deleteModel: function(modelStr){
      var readGroupID = this.get('model').id;
      $.ajax({
        url: '/read_groups/'+readGroupID+'/entity',
        type: 'POST',
        data: {class: modelStr},
        success: function() {
        },
        fail: function(){
        }
      })
    }
  }
});