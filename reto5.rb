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
	[question.delete!("#") , answer.delete!("$") ]
end

def is_value?(real_answer, player_answer)
	p real_answer
	p player_answer
	real_answer == player_answer ? true : false
end

def pre_game()
	puts "..........................."
	puts ""
	puts "Bienvenido al juego Reto 5"
	puts "Estas preparado para jugar?"
	puts ""
	puts "..........................."
	puts ""
	puts "Quieres empezar ahora (Y/N): "
	puts "..........................."
	puts ""
	start = gets.chomp
end

def post_game()
	puts ""
	puts "!MUY BIEN¡"
	puts "Deseas volver a jugar (Y/N): "
	puts ""
	start = gets.chomp
end
def the_end()
	puts ""
	puts ""
	puts "Hasta pronto, te esperamos para que te vuelvas a retar en conocimiento de Web apps"
		puts ""
			puts ""
				puts ""
end
def round(question)
	puts " La pregunta es... "
	puts "#{question}"
	puts ""
	puts "Ahora es tu turno:"
end

def running (play)
	round(play[0])
	test_0 = play[1].gsub("\n","")
	answer = gets.chomp
	is_value?(test_0, answer)? finish=true : finish=false
end	


def game(start)
		if  start == "y" 
		finish = false
		play = read_data()
		while finish == false
			finish = running(play)		
		end
		start = post_game
		if  start == "y"
			game(start)
		end 
	else
		
	end
end

#---------------- Game initialization --------------------
def Reto5()
	start = pre_game()
	game(start)
end
Reto5()
