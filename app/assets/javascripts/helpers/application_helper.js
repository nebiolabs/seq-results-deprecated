Ember.Handlebars.helper('format-date', function(date) {
  return moment(date).format('MMMM Do YYYY');
});

Ember.Handlebars.helper('debug', function(value, options) {
  console.log("Current Context");
  console.log("====================");
  console.log(this);

  if (value) {
    console.log("Value");
    console.log("====================");
    console.log(value);
  }

  debugger;
});