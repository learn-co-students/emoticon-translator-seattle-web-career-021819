# require modules here
require 'yaml'

def load_library(file_path)
  emoticon_hash = YAML.load_file(file_path)
  new_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticon_hash.each do |emotion, emoticon|
    new_hash["get_emoticon"][emoticon[0]] = emoticon[1]
    new_hash["get_meaning"][emoticon[1]] = emotion
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  result = emoticon_hash["get_emoticon"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  result = emoticon_hash["get_meaning"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end
