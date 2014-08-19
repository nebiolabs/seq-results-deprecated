BioProjects.Run = DS.Model.extend({
  id: DS.attr('number'),
  name: DS.attr('string'),
  date: DS.attr('date'),
  instrument: DS.attr('string'),
  instrument_type: DS.attr('string')
});