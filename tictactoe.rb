print "Welcome to your game \n"
print "You should know how to play, but here is a reminder: \n\n\n\n\n\n"
print "X goes first, you will receive a prompt that says 'X:' \n"
print "Enter a number 1 through 9. If the number has been chosen, it will\n"
print "ask you to choose again. The board will be drawn in between rounds.\n"
print "   |   |   \n"
print " 1 | 2 | 3 \n"
print "-----------\n"
print "   |   |   \n"
print " 4 | 5 | 6 \n"
print "   |   |   \n"
print "-----------\n"
print "   |   |   \n"
print " 7 | 8 | 9 \n"
print "   |   |   \n\n\n Let's GO!\n"

class Board
    attr_accessor :squares, :is_x, :game_playing
    def initialize(squares_hash)
        @squares = squares_hash
        @is_x = true
        @game_playing = true
    end

    def draw_board 
        puts "\n   |   |  \n"
        puts " #{squares[1].choice} | #{squares[2].choice} | #{squares[3].choice}  \n"
        puts "-----------\n"
        puts "   |   |   \n"
        puts " #{squares[4].choice} | #{squares[5].choice} | #{squares[6].choice} \n"
        puts "   |   |   \n"
        puts "-----------\n"
        puts "   |   |   \n"
        puts " #{squares[7].choice} | #{squares[8].choice} | #{squares[9].choice} \n"
        puts "   |   |   \n"   
    end

    def round()
        if (game_playing) 
            if self.is_x
                p "X:"
            else
                p "O:"
            end
        position = gets.to_i
        if test_if_picked(position) 
            p "Try Again"
            position = false
        end
        if position
        if self.is_x
            choice_1 = "X"
            self.is_x = false
        else
            choice_1 = "O"
            self.is_x = true
        end
        squares[position].choice = choice_1
        self.draw_board
        self.test_win
    end
        else 
            p "done!"
        end

    end
end

def test_if_picked(position)
    if (self.squares[position].choice == "X" || self.squares[position].choice == "O")
        true
    else
        false
    end
end
            


def test_win()
    # step one: iterate through and get the 
    # numbers where there are say, X's
    test_array_x = []
    test_array_o =[]
    self.squares.each  do |k,v| 
        if (v.choice == "X")
            test_array_x.push(k)
        elsif (v.choice == "O")
            test_array_o.push(k)
        else
            # NOTHING
        end
    end
    if test_choices(test_array_x)
        p "X wins!"
        self.game_playing = false
    elsif
        test_choices(test_array_o)
        p "O wins!"
        self.game_playing = false
    else
        # NOTHING
    end
    #  step two, test the numbers against the possible
    # wins

    # only wins: 123, 456, 789, 147, 258, 369, 159, 357

    # if anything matches, end it

    # then add logic to say: X won, or O won

    # then: play again?
    # self.game_playing = false
end

def test_choices(choices)   
    if (choices.include?(1) && choices.include?(2) && choices.include?(3))
        true
    elsif (choices.include?(7) && choices.include?(8) && choices.include?(9))
        true
    elsif (choices.include?(4) && choices.include?(5) && choices.include?(6))
        true
    elsif (choices.include?(1) && choices.include?(4) && choices.include?(7))
        true
    elsif (choices.include?(2) && choices.include?(5) && choices.include?(8))
        true
    elsif (choices.include?(3) && choices.include?(6) && choices.include?(9))
        true
    elsif (choices.include?(1) && choices.include?(5) && choices.include?(9))
        true
    elsif (choices.include?(3) && choices.include?(5) && choices.include?(7))
        true
    else
        false
    end
end

    
    


class Square
    
    attr_accessor :choice
    attr_reader :position
    def initialize (choice, position)
        @choice = choice
        @position = position
    end
end


square_1= Square.new( ' ', 1)
square_2 = Square.new( ' ', 2)
square_3= Square.new( ' ', 3)
square_4 = Square.new( ' ', 4)
square_5= Square.new( ' ', 5)
square_6 = Square.new( ' ', 6)
square_7= Square.new( ' ', 7)
square_8 = Square.new( ' ', 8)
square_9 = Square.new( ' ', 9)


squares = {
    1 => square_1,
    2 => square_2,
    3 => square_3,
    4 => square_4,
    5 => square_5,
    6 => square_6, 
    7 => square_7,
    8 => square_8, 
    9 => square_9, 
}
board = Board.new(squares)
# this is how you access and change choice
while board.game_playing
    board.round
end
