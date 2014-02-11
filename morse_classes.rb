# This is the most general morse code, not specific to any
# particular letter-to-code mapping
class MorseCode
  
  
  
  
  def self.is_morse_code?(text)
    # =~ is the regular expression matching operator,
    # for our purposes, it returns true if there is a match,
    # and false otherwise.
    # If text contains a non-morse-code character
    if text =~ /[^\.\-\_\/ ]/
      return false
    else
      return true
    end
  end
  
  def self.translate_to_code(text)
    result = []
    text = text.upcase.gsub(/[^[:alnum:] ]/, '')
      .split(" ") 
    text.each do |word|
      word.each_char do |letter|
        # Special handling for space characters?
        # Special handling for non-morsable characters?
        # etc
        result << letters_to_code(letter)
      end
      result = result.insert(-1, " ")
    end
    return result.join(" ").strip
  end
  
  def self.translate_to_english(text)
    # Define method for translating back to english...
    result = []
    text = text.split("  ")
    text.each do |word|
      word = word.split(" ")
      word.each do |code|
        result << code_to_letters(code).strip
      end
      result = result.insert(-1, " ")
    end
    if result[0] =~ /[[:alnum:]]/
      return result.join.strip
    else
      return result.join(" ").strip
    end
  end
  
  def self.letters_to_code(letter)
    raise NotImplementedError.new("::letters_to_code")
  end
  
  def self.code_to_letters(code)
    raise NotImplementedError.new("::code_to_letters")
  end
end





# This is specifically a MorseCode class that maps
# the international standard
class InternationalMorseCode < MorseCode
  
  
  LETTERS_TO_CODE = {
    "A" => ".-",
    "B" => "-...",
    "C" => "-.-.",
    "D" => "-..",
    "E" => ".", 
    "F" => "..-.", 
    "G" => "--.", 
    "H" => "....", 
    "I" => "..", 
    "J" => ".---", 
    "K" => "-.-", 
    "L" => ".-..", 
    "M" => "--", 
    "N" => "-.", 
    "O" => "---", 
    "P" => ".--.", 
    "Q" => "--.-", 
    "R" => ".-.", 
    "S" => "...", 
    "T" => "-", 
    "U" => "..-", 
    "V" => "...-", 
    "W" => ".--", 
    "X" => "-..-", 
    "Y" => "-.--", 
    "Z" => "--..", 
    "1" => ".----",
    "2" => "..---",
    "3" => "...--", 
    "4" => "....-", 
    "5" => ".....", 
    "6" => "-....", 
    "7" => "--...", 
    "8" => "---..", 
    "9" => "----.", 
    "0" => "-----"
  }.freeze
  
  CODE_TO_LETTERS = LETTERS_TO_CODE.invert
  
  def self.letters_to_code(letter)
    encoded_character = LETTERS_TO_CODE[letter]
    return encoded_character
  end
  
  def self.code_to_letters(code)
    encoded_character = CODE_TO_LETTERS[code]
    return encoded_character
  end
end

# This is specifically a MorseCode class that maps
# the American standard
class AmericanMorseCode < MorseCode
  
  LETTERS_TO_CODE = {
    "A" => ".-",
    "B" => "-...",
    "C" => "../.",
    "D" => "-..",
    "E" => ".", 
    "F" => ".-.", 
    "G" => "--.", 
    "H" => "....", 
    "I" => "..", 
    "J" => "-.-.", 
    "K" => "-.-", 
    "L" => "__", 
    "M" => "--", 
    "N" => "-.", 
    "O" => "./.", 
    "P" => ".....", 
    "Q" => "..-.", 
    "R" => "./..", 
    "S" => "...", 
    "T" => "-", 
    "U" => "..-", 
    "V" => "...-", 
    "W" => ".--", 
    "X" => ".-..", 
    "Y" => "../..", 
    "Z" => ".../.", 
    "1" => ".--.",
    "2" => "..-..",
    "3" => "...-.", 
    "4" => "....-", 
    "5" => "---", 
    "6" => "......", 
    "7" => "--..", 
    "8" => "-....", 
    "9" => "-..-", 
    "0" => "______"
  }.freeze
  
  CODE_TO_LETTERS = LETTERS_TO_CODE.invert
  
  def self.letters_to_code(letter)
    encoded_character = LETTERS_TO_CODE[letter]
    return encoded_character
  end
  
  def self.code_to_letters(code)
    encoded_character = CODE_TO_LETTERS[code]
    return encoded_character
  end
end




class InternationaltoAmerican < MorseCode
  I_TO_A = {".-"=>".-", "-..."=>"-...", "-.-."=>"../.", "-.."=>"-..", "."=>".", "..-."=>".-.", "--."=>"--.", "...."=>"....", ".."=>"..", ".---"=>"-.-.", "-.-"=>"-.-", ".-.."=>"__", "--"=>"--", "-."=>"-.", "---"=>"./.", ".--."=>".....", "--.-"=>"..-.", ".-."=>"./..", "..."=>"...", "-"=>"-", "..-"=>"..-", "...-"=>"...-", ".--"=>".--", "-..-"=>".-..", "-.--"=>"../..", "--.."=>".../.", ".----"=>".--.", "..---"=>"..-..", "...--"=>"...-.", "....-"=>"....-", "....."=>"---", "-...."=>"......", "--..."=>"--..", "---.."=>"-....", "----."=>"-..-", "-----"=>"______"}.freeze
    
  def self.code_to_letters(code)
    encoded_character = I_TO_A[code]
    return encoded_character
  end
end
class AmericantoInternational < MorseCode
  A_TO_I = {".-"=>".-", "-..."=>"-...", "../."=>"-.-.", "-.."=>"-..", "."=>".", ".-."=>"..-.", "--."=>"--.", "...."=>"....", ".."=>"..", "-.-."=>".---", "-.-"=>"-.-", "__"=>".-..", "--"=>"--", "-."=>"-.", "./."=>"---", "....."=>".--.", "..-."=>"--.-", "./.."=>".-.", "..."=>"...", "-"=>"-", "..-"=>"..-", "...-"=>"...-", ".--"=>".--", ".-.."=>"-..-", "../.."=>"-.--", ".../."=>"--..", ".--."=>".----", "..-.."=>"..---", "...-."=>"...--", "....-"=>"....-", "---"=>".....", "......"=>"-....", "--.."=>"--...", "-...."=>"---..", "-..-"=>"----.", "______"=>"-----"}.freeze
  
  def self.code_to_letters(code)
    encoded_character = A_TO_I[code]
    return encoded_character
  end
end
