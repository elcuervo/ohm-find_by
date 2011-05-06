$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'ohm'
require 'ohm/find_by'

Ohm.connect(:port => 6379)

class Post < Ohm::Model
  attribute :name
  attribute :author
  attribute :really_long_index_name

  index :name
  index :really_long_index_name
end

setup do
  Ohm.flush
  Post.create(:name => "First Post!", :author => "elCuervo", :really_long_index_name => "yeah")
end

test "find an instance with .find_by_{index_name}" do |created_post|
  searched_post = Post.find_by_name("First Post!").first
  assert searched_post.id == created_post.id
end

test "find an instance even with a really long index name" do |created_post|
  searched_post = Post.find_by_really_long_index_name("yeah").first
  assert searched_post.id == created_post.id
end

test "not find an instance if the index does not exist" do |created_post|
  assert_raise Ohm::Model::IndexNotFound do
    searched_post = Post.find_by_author("elCuervo")
  end
end
