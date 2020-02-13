PgSearch::Model.multisearch_options = {
  :using => [:tsearch, :trigram],
  :ignoring => :accents
}
