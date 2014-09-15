Ember.Handlebars.helper('format-date', function(date) {
  if(date === undefined || date === null){
    return ''
  }
  else
  {
    return moment(date).format('MMMM Do YYYY');
  }
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

Ember.Handlebars.helper('equal?', function(v1, v2) {
  return (v1 == v2)
});

Ember.Handlebars.helper('pluralize', function(count) {
  if(count == 1){
    return count + ' group'
  }
  else
  {
    return count + ' groups'
  }
});
