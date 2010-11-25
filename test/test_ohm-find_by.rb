require 'helper'

class Post < Ohm::Model
  attribute :name
  attribute :author
  attribute :really_long_index_name

  index :name
  index :really_long_index_name
end

class TestOhmFindBy < Test::Unit::TestCase
  context "searching within a Model" do
    setup do
      Ohm.flush
      @created_post = Post.create(:name => "First Post!", :author => "elCuervo", :really_long_index_name => "yeah")
    end

    should "find an instance with .find_by_{index_name}" do
      searched_post = Post.find_by_name("First Post!").first
      assert searched_post.id == @created_post.id
    end

    should "find an instance even with a really long index name" do
      searched_post = Post.find_by_really_long_index_name("yeah").first
      assert searched_post.id == @created_post.id
    end

    should "not find an instance if the index does not exist" do
      assert_raise Ohm::Model::IndexNotFound do
        searched_post = Post.find_by_author("elCuervo")
      end
    end

  end
end
