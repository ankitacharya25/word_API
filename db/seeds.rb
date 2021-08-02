# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
path=Rails.public_path
json_from_file = File.read("#{path}/dictionary.json")
hashs = JSON.parse(json_from_file)


hashs.each do |hash|
  Word.create({word_name: "#{hash[0]}"})
end

hashs.each do |name, values|
  word=Word.find_by(word_name: "#{name}")
  values.each do |name, value|
    value.each do |val|
      if name=='definitions'
        Definition.create({sentence:"#{val['text']}", word_id:"#{word.id}"})
      end
      if name=='examples'
        value['examples'].each do  |val|
         Example.create({example:"#{val['text']}", word_id:"#{word.id}"})
      end
        
      end
       if name=='relatedWords'
         if val['relationshipType']=='synonym'
             val['words'].each do |wd|
                RelatedWord.create({related_word: "#{wd}",word_id:"#{word.id}"})
             end
         end
      end
    end
  end
end