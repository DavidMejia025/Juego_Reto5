#Juego Reto 5

class Player
	attr_reader :name, :points 
	attr_writer :points

	def initialize(name)
		@name = name
		@points = 0
	end

	def record
		@points +=20
	end
end 

class Question
	attr_reader :value
	def initialize(input)
		@value = data_input(input)
	end
	def search_question(id)
		@value[id].gsub("\n","").gsub("#","")
	end
	private
	def data_input(input)
		text = File.readlines(input)
		@value= []
		text.each_with_index do |question,i|
			if (i%2)==0
				@value << question.capitalize
			end
		end 
		@value
	end
end

class Answer
	attr_reader :value
	def initialize(input)
		@value = data_input(input)
	end
	def search_answer(id)
		@value[id].gsub("\n","").gsub("$","")
	end

	private
	def data_input(input)
		text = File.readlines(input)
		@value= []
		text.each_with_index do |answer,i|
			unless (i%2)==0
			   @value << answer.capitalize
			end
		end 
		@value
	end
end

class Game
	attr_reader :select
	attr_writer :select
	def initialize	
		@select = 0;
		@answers = Answer.new("data.txt")
		@questions = Question.new("data.txt")
	end
	def question
		@questions.search_question(@select)
	end
	def answer
		@answers.search_answer(@select)
	end

	def is_value?(real_answer, player_answer)
		real_answer
		player_answer
		real_answer == player_answer ? true : false
	end

	def finish(view, player)
		start = view.win_game(player.name, player.points)
		if start =="n"
			view.stop
			true
		else
			player.points = 0
			@select=0
			false
		end
	end
end

class View
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
	def player_name()
		puts "Cual es tu nombre?: "
		name = gets.chomp 
		player = Player.new(name)
	end
	def continue(question,name)
		puts ""
		puts "..........................."
		puts " => La pregunta es... "
		puts "#{question}"
		puts "..........................."
		puts " => Ahora es tu turno:"
		answer = gets.chomp
		answer = answer.capitalize
	end
	def win_round(name,points)
		puts ""
		puts "..........................."
		puts "!MUY BIEN #{name} Ganaste!!!!!"
		puts "Has conseguido:  #{points} puntos. "
		puts ""
	end
	def win_game(name,points)
		puts ""
		puts "..........................."
		puts "!MUY BIEN #{name} Ganaste!!!!!"
		puts "Has conseguido:  #{points} puntos. "
		puts ""
		puts "Deseas volver a jugar (Y/N): "
		puts "..........................."
		puts ""
		start = gets.chomp
	end
	def stop
		puts ""
		puts "..................................................................................."
		puts "Hasta pronto, te esperamos para que te vuelvas a retar en conocimiento de Web apps"
		puts "..................................................................................."
		
	end
end

#-------------------------------------------------------------------------------------------------#

game = Game.new
view = View.new
start = view.init
player = view.player_name
finish = false
i = 0;
if start == "y"
	while (finish==false) 
		player_answer = view.continue(game.question,player.name)
		if game.is_value?(game.answer,player_answer)
			player.record
			if i == 3
				finish = game.finish(view, player)
				i = 0
			else
				view.win_round(player.name, player.points)
				i += 1
				game.select = i
			end
		end
	end
end

			
