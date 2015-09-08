module MultiDataset
  include MiscProcess

  # Saves all dataspec values in @dataspecs
  def loadAllDatasets
    # Load dataspec paths
    dataspec_paths = JSON.parse(File.read("app/dataspec/importer.json"))[0]["Dataset Config"]
    @dataspecs = Array.new

    # Load all dataspecs into array
    dataspec_paths.each do |dataspec_dir|
      @dataspecs.push(DataspecContent.new(dataspec_dir))
    end
  end

  # Run block of code on all
  def run_all(&block)
    @models.each_with_index do |model, index|
      dataspec = @dataspecs[index]
      yield(dataspec, model)
    end
  end

  # Get all the facets
  def get_all_facets
    @all_facets = Hash.new
    run_all do |dataspec, model|
      facet_fields = get_all_categories(dataspec)
      @all_facets.merge!(facet_fields)
    end
  end

  # Create model
  def create_model(dataspec, model_name)
    doc_class = ClassGen.gen_class(model_name, dataspec)
    settings = ENAnalyzer.analyzerSettings
    mappings = doc_class.mappings.to_hash
    return doc_class
  end

  # Create all models
  def create_all_models
    @models = Array.new
    @dataspecs.each do |dataspec|
      @models.push(create_model(dataspec, gen_class_name(dataspec)))
    end
  end
end
