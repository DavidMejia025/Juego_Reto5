class Question
	attr_reader :question
	def initialize(input)
		@question= []
		text = File.readlines(input)
		text.each_with_index do |question,i|
			if (i%2)==0
				@question <<question
			end
		end 
	end
	def search_question(id)
		@question[id].gsub("\n","").gsub("#","")
	end
end

class Answer
	attr_reader :answer
	def initialize(input)
		@answer= []
		text = File.readlines(input)
		text.each_with_index do |answer,i|
			unless (i%2)==0
				@answer << answer
			end
		end 
	end
	def search_answer(id)
		@answer[id].gsub("\n","").gsub("$","")
	end
end

class Game
	attr_reader :game
	def initialize	
		@game = rand(5)
	end

	def is_value?(real_answer, player_answer)
		real_answer
		player_answer
		real_answer == player_answer ? true : false
	end
	def init
		puts ""
		puts "..........................."
		puts "Bienvenido al juego Reto 5"
		puts "Estas preparado para jugar?"
		puts "..........................."
		puts ""
		puts "..........................."
		puts "Quieres empezar ahora (Y/N): "
		puts "..........................."
		puts ""
		start = gets.chomp
	end
	def continue(question)
		puts ""
		puts "..........................."
		puts " La pregunta es... "
		puts "#{question}"
		puts "..........................."
		puts ""
		puts "..........................."
		puts "Ahora es tu turno:"
		answer = gets.chomp
	end
	def win
		puts ""
		puts "..........................."
		puts ""
		puts "!MUY BIEN¡"
		puts "Deseas volver a jugar (Y/N): "
		puts ""
		start = gets.chomp
	end
	def stop
		puts ""
		puts ""
		puts "Hasta pronto, te esperamos para que te vuelvas a retar en conocimiento de Web apps"
		
	end
end

game = Game.new
question = Question.new("data.txt")
answer = Answer.new("data.txt")
finish = false
start = game.init
if start == "y"
	while (finish==false)
		id = game.game
		q = question.search_question(id)
		ans_test = answer.search_answer(id)
		a = game.continue(q)
		if game.is_value?(ans_test,a)
			start = game.win
			if start =="n"
				finish = true
			end
		end
	end
end


