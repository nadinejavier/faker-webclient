class HedgehogsController < ApplicationController

  def index
    # @hedgehogs = []    
    # api_hedgehogs = Unirest.get("http://localhost:3000/api/v1/hedgehogs.json").body
    # api_hedgehogs.each do |api_hedgehog|
    #   @hedgehogs << Hedgehog.new(api_hedgehog)
   @hedgehogs = Hedgehog.all

  end

  def show
    # @hedgehog = Hedgehog.new(Unirest.get("http://localhost:3000/api/v1/hedgehogs/#{params[:id]}.json").body)
    @hedgehog = Hedgehog.find(params[:id])
  end

  def new
    render "new.html.erb"
  end

  def create
    @hedgehog = Unirest.post("http://localhost:3000/api/v1/hedgehogs.json", :headers => {"Accept" => "application/json"}, :parameters => {first_name: params[:first_name], age: params[:age], color: params[:color], favorite_food: params[:favorite_food]}).body
    redirect_to "/hedgehogs/#{@hedgehog["id"]}"
  end

  def edit
    @hedgehog = Unirest.get("http://localhost:3000/api/v1/hedgehogs/#{params[:id]}.json", :headers => {"Accept" => "application/json"}, :parameters => {first_name: params[:first_name], age: params[:age], color: params[:color], favorite_food: params[:favorite_food]}).body
    render "edit.html.erb"
  end

  def update
    @hedgehog = Unirest.patch("http://localhost:3000/api/v1/hedgehogs/#{params[:id]}.json", :headers => {"Accept" => "application/json"}, :parameters => {first_name: params[:first_name], age: params[:age], color: params[:color], favorite_food: params[:favorite_food]}).body
    redirect_to "/hedgehogs/#{@hedgehog.id}"
  end

    def destroy
    hedgehog = Unirest.delete("http://localhost:3000/api/v2/employees/#{params[:id]}.json")
    redirect_to "/hedgehogs"
  end
end
