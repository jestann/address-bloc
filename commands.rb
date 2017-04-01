# this is a list of all the rails commands i've been using
# as a reference


# rvm gemset create rails425
#       created a new gemset to hold rails 4.2.5

# rvm @rails425
#       switch to using that gemset

# rvm current
#       shows "ruby-2.3.0@rails425"

# gem install rails -v 4.2.5
#       install this version of rails in the gemset rails425
#       now have to make sure you use this gemset every time you use rails

# rvm list
#       this will list everything you installed using rvm
#       rails 4.2.5 doesn't show here because it was installed in a specific gemset

# rvm gemset list
#       list of all gemsets you've created
#       this shows rails425 finally, which is the gemset in which you installed rails 4.2.5
#       could make another gemset to try using rails 5

# rvm gemset use rails425
#       puts you in that gemset, so now you can use rails

# rails -v
#       then you can type this to see what version of rails is installed

# rails new scriptify
#       this makes a new app called scriptify
#       it puts it in a new folder called scriptify
#       it has a Gemfile list of gem dependencies, like json
#       it also makes a routes.rb file that's like ui-router

# rails generate scaffold Script
#       this is more extensive than generate resource
#       it creates a whole CRUD app around the Script object

# rake routes
#       this shows you all your routes
#       which it generated for you in your routes.rb file
#       as you can see, there are CRUD routes pre-made for you
#       they are: index, create, new, edit, show, update, destroy

# rake db:migrate
#       you should always run this after a generate command
#       this creates a database table for your new object
#       or it essentially updates the database

# rails s -p $PORT -b $IP
#       this could also be run as "rails server -p $PORT -b $IP"
#       this runs your app, which is super cool, and fully functional!


=begin

THIS IS THE CRAP I ADDED AFTER MAKING THE CHARACTER MODEL, 
TO TIE IT TO THE SCRIPT MODEL

TONS MORE COMMANDS TO WRITE DOWN... but this is what I saved for now.


class Script < ActiveRecord::Base
    has_many :characters
end


class Character < ActiveRecord::Base
    belongs_to :script
end


THEN I RAKED THE DB AND THEN ADDED ONE LINE TO THE MIGRATION FILE

class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.integer :age

      t.timestamps null: false
      # ADDED THIS LINE
      t.belongs_to :script, index: true
    end
  end
end

AND THAT'S IT FOR NOW, IT COnNECTED THEM CORRECTLY

=end