require 'elasticsearch'

index = 'twitter'
url = 'http://localhost:9200'
es = ElasticSearch::Index.new(index, url)

# Index a document:
type = 'tweet'
doc = {:id => 'abcd', :foo => 'bar'}
es.add(type, doc[:id], doc)

#Get a document:
id = '1234'
es.mget(type, [id])

# Get documents:
id2 = 'abcd'
es.mget(type, [id, id2])

# Search:
query = {
  query: {
  bool: {
  must: {
  query_string: {
  default_field: '_all',
  query: 'foobar!', }
} } } }
es.search(type, query)
