# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get '/' do
  @name = "Dice Roll App"
  erb(:home)
end

get '/dice/2/6' do
  @name = "2d6"
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @result = "You rolled a #{first_die} and a #{second_die}, for a total of #{sum}."

  erb(:twosix)
end

get '/dice/2/10' do
  @name = "2d10"
  first_die = rand(1..10)
  second_die = rand (1..10)
  sum = first_die + second_die

  @result = "You rolled a #{first_die} and a #{second_die}, for a total of #{sum}."

  erb(:twoten)
end

get '/dice/1/20' do
  @name = "1d20"
  @first_dice = rand(1..20)
  @result = "You rolled a #{@first_dice}."

  erb(:onetwenty)
end

get '/dice/5/4' do
  @name = "5d4"
  first_dice = rand(1..4)
  second_dice = rand(1..4)
  third_dice = rand(1..4)
  fourth_dice = rand(1..4)
  fifth_dice = rand(1..4)
  sum = first_dice + second_dice + third_dice + fourth_dice + fifth_dice

  @result = "You rolled a #{first_dice}, #{second_dice}, #{third_dice}, #{fourth_dice}, and #{fifth_dice} for a total of #{sum}."

  erb(:fivefour)
end

get '/dice/100/6' do
  @rolls = []

  100.times do
    die = rand(1..6)
    @rolls.push(die)
  end

  erb(:onehundredsix)
end
