#!/usr/bin/env ruby

# *********************************************
# Jekyll Post Generator Awesomeness
# by Cody Krieger (http://codykrieger.com)
# modified by Fatih Arslan (added Date option)
# *********************************************

# Usage:
# % ./newpost.rb POST NAME

if ARGV.empty? or ARGV[0].downcase == "--help" or ARGV[0].downcase == "-h"
  puts <<-USAGE

  Usage:
  % ./newpost.rb POST NAME

  USAGE

  exit (ARGV.empty? ? 1 : 0)
end

class String
  
  # from ruby on rails (https://github.com/rails/rails)
  # activesupport/lib/active_support/inflector/transliterate.rb
  def parameterize(sep = '-')
    # replace accented chars with their ascii equivalents
    parameterized_string = self.dup
    # Turn unwanted chars into the separator
    parameterized_string.gsub!(/[^a-z0-9\-_]+/i, sep)
    unless sep.nil? || sep.empty?
      re_sep = Regexp.escape(sep)
      # No more than one of the separator in a row.
      parameterized_string.gsub!(/#{re_sep}{2,}/, sep)
      # Remove leading/trailing separator.
      parameterized_string.gsub!(/^#{re_sep}|#{re_sep}$/i, '')
    end
    parameterized_string.downcase
  end

end

TEMPLATE = "template.markdown"
POSTS_DIR = "_posts"

# Get the title and use it to derive the new filename
title = ARGV.join(" ")
filename = "#{Time.now.strftime('%Y-%m-%d')}-#{title.parameterize}.markdown" 
filepath = File.join(POSTS_DIR, filename)
date = Time.now.strftime('%Y-%m-%d %H:%M:%S')

# Load in the template and set the title
post_text = File.read(TEMPLATE)
post_text.gsub!('%%TITLE%%', title)
post_text.gsub!('%%DATE%%', date)

# Write out the post
post_file = File.open(filepath, 'w')
post_file.puts post_text
post_file.close

puts "Successfully created file => #{filepath}"
