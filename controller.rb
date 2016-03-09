require_relative 'lib/rover'
require_relative 'lib/plateau'

class Controller

  def self.run
    num_rover = 0
    num_line = 0
    File.open('input/nasa_commands.txt') do |f|
      plateau_limits = []
      initial_position = []
      f.each_line do |line|
        num_line += 1
        if num_line == 1
          plateau_limits = line.split(' ').map(&:to_i)
          @plateau = Plateau.new(plateau_limits[0], plateau_limits[1])
          #puts "Running all rovers on plateau #{plateau_limits}"
          next
        end
        # even lines have robot initial position and odd lines each robot commands sequence
        if (num_line % 2 == 0)
          initial_position = line.split(' ')
          @rover = Rover.new(@plateau,
                            initial_position[0].to_i,
                            initial_position[1].to_i,
                            initial_position[2])
          num_rover += 1
          puts "Rover #{num_rover} initialized on position #{initial_position}"
        else
          line.each_char do |c|
            if c == 'M'
              @rover.move
            elsif 'L R'.include?(c)
              @rover.rotate(c)
            end
          end
          puts "Rover number #{num_rover} moved from position #{initial_position} with commands #{line.strip} is on FINAL POSITION #{@rover.get_position}"
        end
      end
    end
    puts "Finishing after explore plateau with #{num_rover} rovers...bye!"
  end

end

Controller.run
