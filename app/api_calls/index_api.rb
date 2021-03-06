module IndexApi
  def get_docs_on_index_page(start, index_name)
    http = Curl.get("http://localhost:3000/get_docs_on_index_page", {:start => start, :index_name => index_name})
    return JSON.parse(http.body_str)
  end

  def get_total_docs(index_name)
    http = Curl.get("http://localhost:3000/get_total_docs", {:index_name => index_name})
    return JSON.parse(http.body_str)
  end

  def get_doc(index_name, doc_id)
    http = Curl.get("http://localhost:3000/get_doc", {:index_name => index_name, :doc_id => doc_id})
    return JSON.parse(http.body_str)
  end

  def get_thread(index_name, thread_id)
    http = Curl.get("http://localhost:3000/get_docs_in_thread", {:index_name => index_name, :thread_id => thread_id})
    return JSON.parse(http.body_str)
  end

  def get_dataspec_for_doc(doc)
    index_name = doc["_index"]
    doc_type = doc["_type"]
    http = Curl.get("http://localhost:3000/get_dataspec_for_doc", {:index_name => index_name, :doc_type => doc_type})
    return JSON.parse(http.body_str)
  end

  def get_project_spec(index_name)
    http = Curl.get("http://localhost:3000/get_project_spec", {:index_name => index_name})
    return JSON.parse(http.body_str)
  end

  def get_facet_list_divided_by_source(index_name)
    http = Curl.get("http://localhost:3000/get_facet_list_divided_by_source", {:index_name => index_name})
    return JSON.parse(http.body_str)
  end

  def get_dataspecs_for_project(index_name)
    http = Curl.get("http://localhost:3000/get_dataspecs_for_project", {:index_name => index_name})
    return JSON.parse(http.body_str)
  end

  def get_facets_for_project(index_name)
    http = Curl.get("http://localhost:3000/get_facet_details_for_project", {:index_name => index_name})
    return JSON.parse(http.body_str)
  end

  def run_query(index_name, search_query, range_query, start_offset, facets)
    http = Curl.get("http://localhost:3000/run_query", {:index_name => index_name,
                                                        :search_query => search_query,
                                                        :range_query => range_query,
                                                        :start => start_offset,
                                                        :facet_params => facets
                                                        })
    return JSON.parse(http.body_str)
  end
end
