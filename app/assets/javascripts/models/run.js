SeqResults.Run = DS.Model.extend({
  readGroups: DS.hasMany('readGroup', { async: true }),

  name: DS.attr('string'),
  date: DS.attr('date'),
  instrument: DS.attr('string'),
  instrument_type: DS.attr('string'),

  read_groups_count: DS.attr('number')
});