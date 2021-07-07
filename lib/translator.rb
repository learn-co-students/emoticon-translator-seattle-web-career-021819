# require modules here
require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
	h = {}
	h1 = {}
	h2 = {}
	h["get_meaning"] = {}
	h["get_emoticon"] = {}
	emoticons.each {|meaning, values|
	  h1 = {values[1] => meaning}
	  h["get_meaning"] = h["get_meaning"].merge(h1)
	  h2 = {values[0] => values[1]}
	  h["get_emoticon"] = h["get_emoticon"].merge(h2)
	}
	h
end

def get_japanese_emoticon(file, emoticon)
  emoticons = load_library(file)
	jap_emot = ""
	if emoticons["get_emoticon"].has_key?(emoticon)
		jap_emot = emoticons["get_emoticon"][emoticon]
	else
		jap_emot = "Sorry, that emoticon was not found"
	end
	jap_emot
end

def get_english_meaning(file, emoticon)
  emoticons = load_library(file)
	english_meaning = ""
	if emoticons["get_meaning"].has_key?(emoticon)
		english_meaning = emoticons["get_meaning"][emoticon]
	else
		english_meaning = "Sorry, that emoticon was not found"
	end
	english_meaning
end