require 'sinatra'
require 'sinatra/reloader'


@@number = rand(100)
@@answer = ""

get '/' do
	if params["guess"].to_s.empty?
		message = "Input a guess"
		erb :index, :locals => {:number => @@answer, :message => message}
	else
		guess = params["guess"].to_i
		message = check_guess(guess)
		params["guess"] = ""
		erb :index, :locals => {:number => @@answer, :message => message}
	end		
end

def check_guess(guess)
	if guess > @@number
		return "Too high!"
	elsif guess < @@number
		return "Too low!"
	elsif guess == @@number
		@@answer = @@number.to_s
		return "You're right!"
	else
		return "Unknown input"
	end
end