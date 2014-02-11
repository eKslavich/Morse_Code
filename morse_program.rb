require './Completed_Morse_Classes'



filename = ARGV[1]
morse_type = ARGV[0]
morse_class = nil
case morse_type
when "american"
  morse_class = AmericanMorseCode
when "international"
  morse_class = InternationalMorseCode
when "AtoI"
  morse_class = AmericantoInternational
when "ItoA"
  morse_class = InternationaltoAmerican
else
  raise "We don't know that morse code type!"
end
if filename != nil  
  file = File.open(filename, "r")
  text = file.read
  file.close
else filename == nil
  puts "Type a message to be translated. If message is American morse code put a '/' in certain letters that have whitespace. E.g. R = . .. but the program will interpret . .. as EI because of the space. Therefore type ./.. for R."
  text = $stdin.gets.chomp
end
result = nil
if morse_class.is_morse_code?(text) 
  result = morse_class.translate_to_english(text)
else
  result = morse_class.translate_to_code(text)
end
print result


  
