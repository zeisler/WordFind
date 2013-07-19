def find_words( puzzle, words)
	results = Array.new()

  result = go_east(puzzle, words)
  results << result unless result == false

  result = go_west(puzzle, words)
  results << result unless result == false
	# puzzle is an array of strings
	# words is an array of strings

	# find words in puzzle in eight directions

	# output in results array of strings:
	# WORD(row,column,direction) format

	# your code here!
	return results
end

def go_east(puzzle, words)
  if puzzle.first.scan words.first
    return "#{words[0]}(1,1,east)"
  else
    return false
  end
end

def go_west(puzzle, words)
  if puzzle.first.reverse.scan words.first
    return "#{words[0]}(1,1,west)"
  else
    return false
  end
end
