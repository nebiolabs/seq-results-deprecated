SeqResults.RunsView = Ember.View.extend({
  didInsertElement: function() {
    $('#runs-table').dataTable({
      paging: false,
      info: false,
      "columnDefs": [
        {
          "targets": [ 5 ],
          "visible": false,
          "searchable": true
        }
      ]
    });
  }
});