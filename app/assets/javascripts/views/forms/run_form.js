BioProjects.Views.RunForm = function(id, page){
  this.id = id;
  this.page = page;
  this.$el = $('#run-form-' + this.id);
  this.$submitButton = $('#run-submit');

  this.submit = function(e){
    e.preventDefault();

    $.ajax({
      url: '/runs/' + this.id,
      type: "PATCH",
      data: this.$el.serialize(),
      context: this,
      success: this.submitSuccessHandler
    });
  };

  this.submitSuccessHandler = function(){
    var $notice = $('.notice');
    $notice.html('Run was successfully updated');
    $notice.toggle();
    $notice.fadeOut(5000);
    this.page.table.refreshTable();
  };

  _.bindAll(this, 'submit');

  this.$submitButton.on('click', this.submit)

};