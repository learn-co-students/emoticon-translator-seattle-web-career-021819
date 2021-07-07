require 'yaml'
require 'pry'

def load_library(filepath)
  hash_output = {}
  library_hash = YAML::load(File.open(filepath))
  hash_output["get_meaning"] = {}
  hash_output["get_emoticon"] = {}

  library_hash.each do |emoticon_meanings, emoticon_array|
    # emoticon_array[0] is the ENGLISH emoticon, i.e. "O:)"
    # emoticon_array[1] is the JAPANESE emoticon, i.e. "☜(⌒▽⌒)☞"
    hash_output["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
    hash_output["get_meaning"][emoticon_array[1]] = emoticon_meanings
  end
  hash_output
end


def get_japanese_emoticon(filepath, english_emoticon)
  string_output = ""
  library_hash = load_library(filepath)
  if library_hash["get_emoticon"].key?(english_emoticon)
    string_output = library_hash["get_emoticon"][english_emoticon]
  else
    string_output = "Sorry, that emoticon was not found"
  end
  string_output
end

def get_english_meaning(filepath, japanese_emoticon)
  string_output = ""
  library_hash = load_library(filepath)
  if library_hash["get_meaning"].key?(japanese_emoticon)
    string_output = library_hash["get_meaning"][japanese_emoticon]
  else
    string_output = "Sorry, that emoticon was not found"
  end
  string_output
end
