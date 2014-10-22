SeqResults.ApplicationStore = DS.Store.extend({
});

SeqResults.ApplicationAdapter = DS.ActiveModelAdapter.extend({

});

SeqResults.ApplicationSerializer = DS.ActiveModelSerializer.extend({
  normalizeHash: {
    runs: function(hash) {
      hash.instrument = hash.instrument_name;
      delete hash.instrument_name;
      return hash;
    }
  }
});