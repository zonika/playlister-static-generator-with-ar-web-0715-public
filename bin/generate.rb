require_relative '../config/environment'

LibraryParser.new("db/data").call
SiteGenerator.new("_site").call