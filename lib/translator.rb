require 'pry'
require 'yaml'

def load_library(file)
  emoticons_hash = YAML.load_file(file)
  emoticon_library = {"get_emoticon" => {}, "get_meaning" => {}}
  emoticons_hash.each do |emotion, emoticons|
    emoticon_library["get_meaning"][emoticons[1]] = emotion
    emoticon_library["get_emoticon"][emoticons[0]] = emoticons[1]
end
emoticon_library
end

def get_japanese_emoticon(file, emoticon)
  emoticon_library = load_library(file)
  answer = emoticon_library["get_emoticon"][emoticon]
       if answer
        answer
      else
        "Sorry, that emoticon was not found"
end
end

def get_english_meaning(file, emoticon)
  emoticon_library = load_library(file)
  answer = emoticon_library["get_meaning"][emoticon]
       if answer
        answer
      else
        "Sorry, that emoticon was not found"
end
end
