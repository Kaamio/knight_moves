class BoardSquare

attr_accessor :position, :path

def initialize(position, path)
	@position = position
	@path = path	
end
end



def knight_moves(start, fin)

#jonon ensimmäinen ruutu on uusi boardclass sarjan olio arvoilla esim 1,1 , [1,1]. Jälkimmäinen 
#luku on path	
queue = [BoardSquare.new(start, [start])]

#Array jossa kaikki solut joissa käyty
visited = [start]

until queue.empty?
	current = queue.shift
	
	possiblemoves = possible_moves(current.position).select {|move| !visited.include?(move)}
	

	if possiblemoves.include?(fin)
		current.path << fin
			if current.path.size-1 == 1 
				puts "You made it in #{current.path.size-1} move!"
			else
				puts "You made it in #{current.path.size} moves!"
			end
		current.path.each{|pos| p pos}
		return
	end

#jos maali ei ole tämän siirron mahdollisuuksissa, pusketaan mahdollisuudet jonoon. 
#Jokaisella mahdollisuudella on oma path joka kertoo mistä siihen on tultu
possiblemoves.each do |move| 
	queue << BoardSquare.new(move,(current.path + [move]))
	visited << move
end
end
	#changes = [[-2,-1], [-2,1], [-1,-2], [-1,2], [2,-1], [2,1], [1,-2], [1,2]]

end
def possible_moves(loc)
	moves = [loc[0]+1, loc[1]+2], [loc[0]+2, loc[1]+1], [loc[0]-1, loc[1]+2], 
	[loc[0]-2, loc[1]+1],  [loc[0]-1, loc[1]-2], [loc[0]-2, loc[1]-1],	
	[loc[0]+1, loc[1]-2], [loc[0]+2, loc[1]-1]	

	moves.select {|move| is_valid?(move)}
end	

def is_valid?(pos)
	return (pos[0] > -1 && pos[0]<8) && (pos[1]>-1 && pos[1] < 8) ? true : false
end

	
		


puts knight_moves([5,7], [1,2])
