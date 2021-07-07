require 'pry'
require 'yaml'
 file_path = './lib/emoticons.yml'


def load_library(file_path)
  translator = {"get_meaning" => {}, "get_emoticon" => {}}
  library = YAML.load_file(file_path)

  library.each do |meaning_key, emoticon_array|
    translator["get_meaning"][emoticon_array[1]] = meaning_key
    translator["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
  end

   #binding.pry
  return translator
end

def get_japanese_emoticon(file_path, emoticon)
  translator = load_library(file_path)
  get_emoticon_hash = translator["get_emoticon"]
  get_emoticon_hash.each do |english_emoticon, japanese_emoticon|
    if emoticon == english_emoticon
      return japanese_emoticon
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  translator = load_library(file_path)
  get_meaning_hash = translator["get_meaning"]
  get_meaning_hash.each do |japanese_emoticon, meaning|
    if emoticon == japanese_emoticon
      return meaning
    end
  end 
  return "Sorry, that emoticon was not found"
end
