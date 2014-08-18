BioProjects.Views.Page = function(){
  this.form = new BioProjects.Views.Form('#form-side');
  this.table = new BioProjects.Views.Table('#table-side');
  this.$header = $('h2', '#header');

  this.initializePage = function(){
    this.table.$el.addClass('large-12');

    // refactor
    new BioProjects.Collections.Runs(this);
    this.$header.html('Runs')
  };

  this.addForm = function(dataObject, template){
    this.table.$el.removeClass('large-12');
    this.table.$el.addClass('large-6');

    this.form.$el.addClass('large-6');
    this.form.$el.html(HandlebarsTemplates[template](dataObject));
  };

  _.bindAll(this, 'initializePage', 'addForm');

  this.initializePage();
};