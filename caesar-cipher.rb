def caesar_cipher_wrap(string, shift_int)
    # split the original string
    numString = string.split('')

    #set default values
    changedArray = []
    asciiValue = nil

    numString.each do |char|
        #if element is lowercase or capital letter, shift it
        if char.ord.between?(65, 90) || char.ord.between?(97, 122)
            asciiValue = char.ord
            asciiValue += shift_int.to_i
            asciiValue = anti_wrap(asciiValue)
            #add shifted value to array
            changedArray.push(asciiValue.chr)
        else
            #add unchanged char if char isnt letter
            changedArray.push(char)
        end
    end

    #join and return
    changedString = changedArray.join()
    puts "new secret coded string: #{changedString}"
end

def anti_wrap(asciiInt)
    #if shift brings letter outside of alphabet, wrap it around
    if asciiInt.between?(90, 96)
        #get how far outside the alphabet the shift goes
        newShift = asciiInt - 91
        #shift this remainder from a (65)
        asciiInt = 65 + newShift
    elsif asciiInt > 122
        newShift = asciiInt - 123
        asciiInt = 97 + newShift
    end
    return asciiInt if asciiInt.between?(64, 90) || asciiInt.between?(97, 122)
    anti_wrap(asciiInt)
end

# in order to properly detect wrap with double digit numbers I think that the shift_int has to be a part of the anti_wrap function
# checking to see if it is pos or negative and if the char is upper or lowercase before adjusting
# currently the wrap is incorrect for huge numbers

# maybe find a way to remember the position of uppercase letters in the string, lowercase the string, wrap only by the lowercase alphabet
# and then uppercase specific characters by position after, this would make it much easier to impliment negative wrapping as well
# I think this is the way to go, maybe later.

# maybe add a play_again()

#much simpler version with no wrap
def caesar_cipher(string, shift_int)
    numString = string.split('').map(&:ord)
    numString.map! { |i| i + shift_int.to_i }
    return numString.map(&:chr).join('')
end

#simple code to get variables for argument and call function
puts "Enter a string and a shift int"
print "string: "
string = gets.chomp
print "shift int: "
shift_int = gets.chomp

caesar_cipher_wrap(string, shift_int)


