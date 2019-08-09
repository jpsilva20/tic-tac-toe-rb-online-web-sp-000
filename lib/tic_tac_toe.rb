WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end 

def move(board, index, player)
  board[index] = player
end 

def position_taken?(board, index)
  board[index] == "X" or board[index] == "O"
end 


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(index)
end



def turn_count(board)
  turn = 0 
  board.each do |index|
    if index == "X" or index == "O"
      turn += 1
    end 
  end 
  return turn
end 

def current_player(board)
  num_turns = turn_count(board)
  if num_turns % 2 == 0 
    player = "X"
  else 
    player = "O"
  end 
  return player 
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else 
    turn(board)
  end 
end 


def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? {|index| index == "X" or index == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true 
  else 
    return false 
  end 
end 

def over?(board)
  if won?(board) or draw?(board)
    return true 
  else 
    return false
  end 
end 

def winner(board)
  index = []
  index = won?
  if index == false 
    return nil 
  else 
    if board[index[0]] == "X"
      return "X"
    else 
      return "O"
    end 
  end 
end

def play(board)
  until over? == true 
    turn 
  end 
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end 
end
end 