def beginning_of_program                                                   # 1
  returnvalue = selection
  min_less_than_max(returnvalue, 'a', 'b', 'MINIMUM', 'MAXIMUM')  # 2 and 3 happen prior
end

def selection                                                              # 2
  choice = nil
  loop do
    puts "What would you like to practice?"
    puts "Select one from below: (type quit at any time to exit the program)"
    puts "---------------------------------"
    array_of_options('choice')
    choice = gets.chomp.downcase
    break if choice == 'quit' || array_of_options(choice.to_sym)
    puts "You must select one of the options given"
    puts "---------------------------------"
  end
  choice
end

def array_of_options(value)                                                # 3
  option = value
  array = [ :'a % b',
            :'a.divmod(b)',
            :'a.remainder(b)',
            :'a % b and a.divmod(b)',
            :'a % b and a.remainder(b)',
            :'a.divmod(b) and a.remainder(b)',
            :'a % b and a.divmod(b) and a.remainder(b)']
  
  case option
  when 'choice' then        array.each { |options| puts options }
  else               return array.include?(option)
  end
end

def min_less_than_max(returnvalue, a, b, minimum, maximum)                 # 4
  a_min = nil
  a_max = nil
  b_min = nil
  b_max = nil
  loop do
    loop do
      a_min = what_is_n(a, minimum)
      a_max = what_is_n(a, maximum)
      break if a_min < a_max
      puts "The MINIMUM must be less than the MAXIMUM"
    end
    loop do
      b_min = what_is_n(b, minimum)
      b_max = what_is_n(b, maximum)
      break if b_min < b_max
      puts "The MINIMUM must be less than the MAXIMUM"
    end
    break if are_you_sure(returnvalue, a_min, a_max, b_min, b_max)
  end
  a_program_b(returnvalue, a_min, a_max, b_min, b_max)
end

def what_is_n(n, word)                                                     # 5
  n_minimum = nil 
  n_minimum = number_spectrum(n, word)
end

def number_spectrum(x, minmax)                                             # 6
  puts "What would you like the number spectrum for #{x} to be?"
  value = spectrum_specific(minmax)
end

def spectrum_specific(word)                                                # 7
  value = nil
  loop do
    puts "Select a #{word} from -30 to 30"
    value = gets.chomp
    break if integer_checker?(value) && (value.to_i <= 30 && value.to_i >= -30)
    puts 'The number needs to be in the spectrum of -30 to 30'
  end
  value
end

def integer_checker?(number)                                               # 8
  number.to_i.to_s == number
end

def are_you_sure(value, a_min, a_max, b_min, b_max)                        # 9                 
  puts "Here are the options you selected:"
  puts "You chose #{value} with the"
  puts "a spectrum being #{a_min} to #{a_max} and the"
  puts "b spectrum being #{b_min} to #{b_max}"
  loop do
    puts "Are you sure these are the options you want (type yes or no)?"
    option = gets.chomp.downcase
    case option
    when 'yes' then break true
    when 'no'  then beginning_of_program
    end
  end
end

def a_program_b(returnvalue, a_min, a_max, b_min, b_max)                  # 10
  right = 0
  wrong = 0
  loop do
    a_value = random_number(a_min, a_max).to_i
    b_value = nil
      loop do
        b_value = random_number(b_min, b_max).to_i 
        break if b_value != 0
      end
    answer = which_question(returnvalue, a_value, b_value).to_s
    #p answer
    given_answer = gets.chomp.to_s
    break if given_answer == 'quit'
    given_answer == answer ? right += 1 : wrong += 1
    percentage = ((right.to_f / (right.to_f + wrong.to_f)).round(4))*100
    puts "correct!: #{ percentage }%" if given_answer == answer
    puts "incorrect: #{ percentage }%" if given_answer != answer
    puts "Incorrect: The correct answer is: #{answer}" if given_answer != answer
    puts "Total amount of questions answered: #{right + wrong}"
    #p percentage
    break if percentage > 85 && (right + wrong) >= 30
    puts "--------------------"
  end
end

def random_number(n1, n2)                                                  #11
  rand(n1.to_i..n2.to_i)
end

def which_question(returnvalue, a_value, b_value)                         # 12
  question = returnvalue
  case question
  when 'a % b'                                    then question_1(a_value, b_value)
  when 'a.divmod(b)'                              then question_2(a_value, b_value)
  when 'a.remainder(b)'                           then question_3(a_value, b_value)
  when 'a % b and a.divmod(b)'                    then question_4(a_value, b_value)
  when 'a % b and a.remainder(b)'                 then question_5(a_value, b_value)
  when 'a.divmod(b) and a.remainder(b)'           then question_6(a_value, b_value)
  when 'a % b and a.divmod(b) and a.remainder(b)' then question_7(a_value, b_value)
  end
end

def question_1(a_value, b_value)                                          # 13
  puts "#{a_value} % #{b_value}"
  a_value % b_value
end

def question_2(a_value, b_value)                                          # 14
  puts "#{a_value}.divmod(#{b_value})"
  (a_value.divmod(b_value))
end

def question_3(a_value, b_value)                                          # 15
  puts "#{a_value}.remainder(#{b_value})"
  a_value.remainder(b_value)
end

def question_4(a_value, b_value)                                          # 16
  returnvalue = [ 'a % b', 'a.divmod(b)' ].sample
  which_question(returnvalue, a_value, b_value)
end

def question_5(a_value, b_value)                                          # 17
  returnvalue = [ 'a % b', 'a.remainder(b)' ].sample
  which_question(returnvalue, a_value, b_value)
end

def question_6(a_value, b_value)                                          # 18
  returnvalue = [ 'a.divmod(b)', 'a.remainder(b)' ].sample
  which_question(returnvalue, a_value, b_value)
end

def question_7(a_value, b_value)                                          # 19
  returnvalue = [ 'a % b', 'a.divmod(b)', 'a.remainder(b)', ].sample
  which_question(returnvalue, a_value, b_value)
end



beginning_of_program




#this is mostly complete, putting the methods in some sort of order is the last thing to do