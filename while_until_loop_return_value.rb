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
  more exposure

the issue seems to be when the counter is not at 0

=end
