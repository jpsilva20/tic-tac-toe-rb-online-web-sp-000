WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]] 

def play(board)
  turn(board) until over?(board)
  end 
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end 
end 

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
end

def won?(board)
  WIN_COMBINATIONS.each {|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end    
  }
  return false 
end 

def full?(board)
  board.all? {|index| index == "X" or index == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end 

def over?(board)
  won?(board) or draw?(board) or full?(board)
end 

def input_to_index(input)
  input.to_i - 1
end 

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else 
    turn(board)
  end 
end 

def position_taken?(board, index)
  board[index] == "X" or board[index] == "O"
end 

def current_player(board)
  turn_number = turn_count(board)
  if turn_number % 2 == 0  
    return "X"
  else 
    return "O"
  end 
end

def turn_count(board)
  board.count {|token| token == "X" or token == "O"
end 


def move(board, index, character)
  board[index] = character
end 

def winner(board)
  if won?(board) == true
    board[won?(board)[1]]
  end 
end
 