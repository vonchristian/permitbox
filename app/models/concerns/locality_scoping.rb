module LocalityScoping
  def for_locality(options={})
    where(locality: options[:locality])
  end
end
