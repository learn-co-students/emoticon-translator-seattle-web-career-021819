require "yaml"
#require "pry"

def load_library(file)
  library = YAML.load_file(file)

  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}

  library.each do | meaning, emoticons|
    new_hash["get_meaning"][emoticons[1]] = meaning
    new_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  new_hash

end

def get_japanese_emoticon(file, emoticon)
  check_hash = load_library(file)

  if check_hash["get_emoticon"].has_key?(emoticon)
    return check_hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  check_hash = load_library(file)

  if check_hash["get_meaning"].has_key?(emoticon)
    return check_hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

#get_japanese_emoticon("/Users/njengak/Development/code/labs/hash_labs/emoticon-translator-seattle-web-career-021819/lib/emoticons.yml",":)")
