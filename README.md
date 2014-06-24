---
tags: activerecord associations, ERB
languages: ruby
resources: 3
level: advanced
---

# Static Playlister on ActiveRecord

## Welcome to the Web!
In this lab, you're going to making some sweet static websites.  Static means no Rails or Sinatra.  Instead you're going to use two resources that both depend on to make dynamic websites, ActiveRecord and [ERB](http://ruby-doc.org/stdlib-2.1.2/libdoc/erb/rdoc/ERB.html).

Using those two tools you'll create [ERB template](http://www.stuartellis.eu/articles/erb/) files that end in `.html.erb`.  This will be where you can call your ActiveRecord models - `Artist`, `Genre`, and `Song` - to access all the information stored in your database about each one.


## ActiveRecord Associations

In this lab, you'll be recreating the basic functionality of Playlister using [ActiveRecord associations](http://guides.rubyonrails.org/association_basics.html). In plain English, the point of your association is to let ActiveRecord and your program know that an artist has many songs and therefore those songs belong to that artist. 

You'll have three models: `Artist`, `Song`, and `Genre`. The `Artist` and `Genre` model will each know about it's associated songs.  To create these associations you will need write proper migrations and ActiveRecord macros, special methods created by ActiveRecord's DSL.

The model tests will be calling methods that your models will, by default, have if your associations are correctly defined. You do not need to write those methods.  You also have the `rake db:seed` task defined and functioning.  Once your associations are completed you will be able to seed the database for work in development.

#### Creating Your Associations
- Create your models in `app/models`
- Write migrations for your models and associations in `db/migrations`
- Your models will need an instance method called `slugified_name` for making urls
  - ex. `an_artist.slugified_name #=> kanye-west`


## ERB and Static HTML Sites

Embedded Ruby is a way of adding Ruby to a file that would normally be unable to run the language.  It had become synonymous with Rails because it relies on ERB so much, but you'll be making your own generator that will read an HTML ERB file to create many static pages.

#### Index Pages
Each model will generally have an index page.  Often they list all instances of model
- You will need to generate an index page for the top level of `app/views/`
  - The index should have a link to each model and a count of total instances
    - ex. `Artists -  42`
- Your index pages should be called `index.html.erb`
- Each model will have an index page in their appropriate folder in `app/views` directory
  - This index lists every instance and links to that instances show page

#### Show Pages
An instance of a model will often have `show.html.erb` that is rendered as a regular HTML file with information specific to that instance.
- Each model will have show pages in `app/views/<model>/`
- `Artist` show pages will have a list of and link to its songs.
- `Genre` show pages will have a list of and link to its songs.
- `Song` show pages will state the instance's name.

####Site Generator
You will need a class whose sole purpose is generating the static pages.


## Bonus
If you've finished everything and want more of a challenge unpend the pending RSPEC tests and create a [has many through association](http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association) for your models.