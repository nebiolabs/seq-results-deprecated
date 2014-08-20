Ember.Handlebars.helper('format-date', function(date) {
  return moment(date).format('MMMM Do YYYY');
});