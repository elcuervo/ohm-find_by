= ohm-find_by

This is just a fast implementation of AR find_by_{attr} for Ohm

  class Post < Ohm::Model
    attribute :name
    attribute :author

    index :name
  end

With that Ohm::Model in mind now you can do this:

  Post.create :name => "My first Post", :author => "elCuervo"
  => #<Post:1 name="My first Post" author="elCuervo">
  Post.find_by_name "My first Post"
  => #<Set (Post): ["1"]>

Also checks the existence of the index before searching so:

  Post.find_by_author "elCuervo"
  => Ohm::Model::IndexNotFound

== Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

== Copyright

Copyright (c) 2010 Bruno Aguirre. See LICENSE for details.
