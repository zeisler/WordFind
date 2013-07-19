def find_words( puzzle, words)
  results = Array.new()
  words.each do |word|
    puzzle.each do |puzzle|
      result = go_east(puzzle, word)
      results << result unless result == false

      result = go_west(puzzle, word)
      results << result unless result == false
    end
  end
  if puzzle.length > 1
    result = go_south(puzzle, words)
    results << result unless result == false

    result = go_north(puzzle, words)
    results << result unless result == false
  end
  # puzzle is an array of strings
  # words is an array of strings

  # find words in puzzle in eight directions

  # output in results array of strings:
  # WORD(row,column,direction) format

  # your code here!
  return results
end

def go_east(puzzle, word)
  if (puzzle.scan word).length > 0
    return "#{word}(1,1,east)"
  else
    return false
  end
end

def go_west(puzzle, word)
  if (puzzle.reverse.scan word).length > 0
    return "#{word}(1,1,west)"
  else
    return false
  end
end

def go_south(puzzle, word)
  shift_180 = ""
  row_num = puzzle.length
  row_num.times do |row|
    row = puzzle[row].gsub "-", ""
    shift_180 += row
  end
  result = go_east(shift_180, word.first)
  if result == false
    return false
  else
    return result
  end
end

def go_north(puzzle, word)
  shift_180 = ""
  row_num = puzzle.length
  range = (0..row_num).to_a.reverse

  range.each do |row|
    shift_180 += puzzle[row] unless puzzle[row].nil?
  end
  puts shift_180
  result = go_east(shift_180, word.first)
  if result == false
    return false
  else
    return result
  end
end

puts find_words(%w{- - - D R O W},["WORD"])
