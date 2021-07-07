require "yaml"

def load_library(path)
  library=YAML.load_file(path)
  library
  p library
  final={"get_meaning"=> {}, 'get_emoticon'=> {}}
  library.each do |k, v|
    final["get_meaning"][v[1]]=k
    final["get_emoticon"][v[0]]=v[1]
  end
  final
  
end

def get_japanese_emoticon (path, emote)
  library=load_library(path)
  if(!library["get_emoticon"].has_key?(emote))
    return "Sorry, that emoticon was not found"
  else
    library["get_emoticon"][emote]
  end
end

def get_english_meaning (path, emote)
  library=load_library(path)
  if !library["get_meaning"].has_key?(emote)
    return "Sorry, that emoticon was not found"
  else
    library["get_meaning"][emote]
  end
end