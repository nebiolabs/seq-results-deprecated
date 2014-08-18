BioProjects.Views.RunRow = function(data, page){
  this.id = data.id;
  this.page = page;
  this.formTemplate = 'forms/run';

  this.$el = $('#run-'+this.id);

  this.click = function(e){
    e.preventDefault();
    $.ajax({
      url: '/runs/'+this.id+'.json',
      context: this,
      success: this.clickSuccessHandler
    });
  };

  this.clickSuccessHandler = function(data){
    this.page.addForm(data, this.formTemplate);
    new BioProjects.Views.RunForm(data.id, page);
  };

  _.bindAll(this, 'click', 'clickSuccessHandler');
  this.$el.on('click', this.click)

};