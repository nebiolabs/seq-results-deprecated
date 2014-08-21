BioProjects.ReadGroup = DS.Model.extend({
  run: DS.belongsTo('run', { async: true }),

  library: DS.attr('string'),
  barcode: DS.attr('string'),
  sample: DS.attr('string')
});