def string_lengths(sentence)
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

=begin
problem: the issue is i cannot get until loops correct when i see them. i need
  more exposure. I need to throw while loops into the mix as well to keep me on
  my toes. 

the issue seems to be when the counter is not at 0
I would say that you need the counter to be in different places within the
  while/until loop. 
  -the counter should be declared outside the loop, but inside the method
  -you will need approximately 5 different methods that would go in the place
    of size or push
      -maybe up to 10 considering you are needing two different methods
        -those methods are
          #length/size
          #push/pop unshift/shift
          #sum (it seems realistic to include another numerical based method)
          #drop/take
          #uniq
          #
          #
          #
          #
          #
  -the loop should only be three max lines


=end
