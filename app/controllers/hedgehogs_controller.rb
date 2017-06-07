class HedgehogsController < ApplicationController

  def index
    @hedgehog = Unirest.get("http://localhost:3000/api/v1/hedgehogs.json").body
  end

  def show
    @hedgehog = Unirest.get("http://localhost:3000/api/v1/hedgehogs/#{params[:id]}.json").body
  end

  def new
    render "new.html.erb"
  end

  def create
    @hedgehog = Unirest.post("http://localhost:3000/api/v1/hedgehogs.json", :headers => {"Accept" => "application/json"}, :parameters => {first_name: params[:first_name], age: params[:age], color: params[:color], favorite_food: params[:favorite_food]}).body
    redirect_to "/hedgehogs/#{@hedgehog["id"]}"
  end

  def update
    @hedgehog = Unirest.patch("http://localhost:3000/api/v1/hedgehogs/#{params[:id]}.json", :headers => {"Accept" => "application/json"}, :parameters => {first_name: params[:first_name], age: params[:age], color: params[:color], favorite_food: params[:favorite_food]}).body
    redirect_to "/hedgehogs/#{@hedgehog["id"]}"
  end
end
