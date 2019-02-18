# require modules here
require "yaml"

def load_library(lib)
  # code goes here
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons = YAML.load_file(lib)
  emoticons.each do |meaning, values|
    new_hash["get_meaning"][values[1]] = meaning
    new_hash["get_emoticon"][values[0]] = values[1]
  end

  new_hash
end

def get_emoticon(file, emoticon, key)
  emoticons_hash = load_library(file)
  emote = emoticons_hash[key][emoticon]

  if !emote
    "Sorry, that emoticon was not found"
  else
    emote
  end
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  get_emoticon(file, emoticon, "get_emoticon")
end

def get_english_meaning(file, emoticon)
  # code goes here
  get_emoticon(file, emoticon, "get_meaning")
end