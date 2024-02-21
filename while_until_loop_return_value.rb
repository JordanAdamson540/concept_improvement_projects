def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1 #change

  until counter == strings.size do #change the == sign and the type of loop
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1 #change
  end

  lengths
end

#the question should ask 'what is the return value of the code above'
#the question should give a string length of anywhere between 0 and 9
#do not change anything besides the five change slots 
#the loops to use are while until and loop
# 3 loops, 5 comparators, 10 initial counter numbers, 2 signs for changing the counter
loop_type = [:while, :unil, :loop]
counter_change = [:positive, :negative]
comparator = [:greater_than, :greater_than_or_equal, :less_than, :less_than_or_equal, :equal]
initial_counter = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
=begin
problem: the issue is i cannot get until loops correct when i see them. i need
  more exposure. I need to throw while loops into the mix as well to keep me on
  my toes. 
=end