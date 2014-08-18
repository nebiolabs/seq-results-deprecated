BioProjects.Collections.Runs = function(page){
  this.page = page;

  this.decorateData = function(data){
    this.collection = $.map(data, function(record){
      return new BioProjects.Models.Run(record);
    });

    this.page.table.$tbody.html(HandlebarsTemplates['tables/runs'](this));

    $.map(data, this.createRunRows);
    this.page.table.currentTableCollection = this;
  };

  this.getData = function(){
    $.ajax({
      url: '/runs.json',
      context: this,
      success: this.decorateData
    });
  };

  this.createRunRows = function(record){
    new BioProjects.Views.RunRow(record, this.page);
  };

  _.bindAll(this, 'decorateData', 'getData', 'createRunRows');

  this.getData()
};