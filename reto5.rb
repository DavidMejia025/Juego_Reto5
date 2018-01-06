# Juego Reto 5.
# En este juego se le permitira a un jugador exponerse al reto de contestar ciertas preguntas

require "pry"
def read_data()
	text = File.readlines("data.txt")
	options = []
	text.length.times do |i|
		options << i
	end
	game = find_question(text, options)
end

def find_question(text, array)
	ind = array.sample
	if text[ind].include? "#"
		question = text[ind]
		answer = text[ind+1]
		
	else
		question = text[ind-1]
		answer = text[ind]
	end
	[question, answer]
end

def is_value?(real_answer, player_answer)
	p real_answer
	p player_answer
	real_answer == player_answer ? true : false
end

def pre_game()
	puts "Bienvenido al juego Reto 5"
	puts "Estas preparado para jugar?"
	puts "..........................."
	puts "..........................."
	puts "Quieres empezar ahora Y/N: "
	start = gets.chomp
end

def round(question)
	puts "* Ahora viene tu pregunta: "
	puts "Cual es #{question}."
	puts "Ahora es tu turno:"
end
#---------------- Game initialization --------------------
def game()
	start = pre_game()
	if  start == "y" 
		finish = false
		game = read_data()
		while finish == false
			round(game[0])
			answer = gets.chomp
			is_value?(game[1], answer)? finish=true : finish=false
			p finish
		end
	else
		game()
	end
end
game()
read_data(1)
p is_value?(1,2)