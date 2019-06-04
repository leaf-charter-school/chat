require "sinatra"
require 'pry'
require 'csv'

def array_of_groceries
  groceries = []
  CSV.foreach('grocery_list.csv', headers: true) do |row|
    groceries << [row["name"], row["quantity"]]
  end
groceries
end

get '/' do
  redirect '/grocery-list'
end

get '/grocery-list' do
  @groceries = array_of_groceries

  erb :index
end

get '/grocery-list/:grocery' do
@url = params[:grocery]

erb :show
end

post '/grocery-list' do
  @name = params[:Name]
  @quantity = params[:Quantity]

  if @name != "" && @quantity != ""
    CSV.open('grocery_list.csv', 'a') do |csv|
      csv << [@name, @quantity]
    end
    redirect '/'
  else
    @error = "error - you must submit a grocery and a quantity"
    erb :index

  end


end
