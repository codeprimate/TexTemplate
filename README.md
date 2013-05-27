# TexTemplate

LaTeX template for general document use.

Requires xelatex, Ruby, RubyGems, and the Bundler gem.  You may substitute another Latex engine in the Rakefile.

## Setup

    $ gem install bundler
    $ bundle install

## Rake Tasks

    $ rake clean
    $ rake 
    $ rake pdf
    $ rake TEX_FILENAME_MINUS_EXTENSION

## Using Guard

    $ bundle exec guard  # Automatically compile tex sources as they are updated


(c)2013 Patrick Morgan. Use freely! See LICENSE for details.
