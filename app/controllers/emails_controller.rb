class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def create
    @email = Email.new
    @email.object = Faker::Book.title
    @email.body = Faker::Book.title
    @email.read = false
    @email.save
    respond_to do |format|
      format.html do
        redirect_to root_path
        flash[:notice] = "Task created"
      end

      format.js
    end
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @email = Email.find(params[:id])
    if @email.read
      @email.read = false
    else
      @email.read = true
    end
    @email.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.js
    end
  end
end
