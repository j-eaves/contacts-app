class ContactsController < ApplicationController
  def index
    #this action will send to a page that will
    #show all of the contacts, 
    #but will also be the landing page
    @contacts = Contact.all
    render 'index.html.erb'
  end
  
  def new
    #this action will send you to a form 
    #where you can create a new contact
    #this action ONLY renders a form
    #the submit button commits to the db and sends it to the show page
    render 'new.html.erb'
  end

  def create
    #this action will actually implement the form
    #and commit the new contact to the database
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
      )
    @contact.save #update does this automatically
    flash[:create] = "You created a contact"
    redirect_to "/contacts/#{@contact.id}"
    #render 'create.html.erb'
  end

  def show
    #this will send you to show page that gives one contact's info
    #where you can search for one contact
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    #@contact = Contact.find_by(id: "id") #this is a temp situation, showing the first contact
    #redirect_to "/contacts/#{@contact.id}"
    #if @contact.first_name == nil
    #  render 'index.html.erb'      
    #else
    render 'show.html.erb'  
    #end
  end

  def edit
    #create an if statement that corresponds to a form with info
    @contact = Contact.find_by(id: params[:id])
    flash[:edit] = "You edited a contact"
    render 'edit.html.erb'
  end

  def update
    #ruins everything if you don't update all fields
    #not showing changes after update
    #does not show default values
    @contact = Contact.find_by(id: params[:id]) #either 'id' should be what it currently is, or @contact.id
    #update saves these attributes automatically
    @contact.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number]
      )
    flash[:update] = "You updated a contact"
    redirect_to "/contacts/#{@contact.id}" #redirecting to show
    #render 'update.html.erb'
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    #redirect_to "/contacts/#{@contact.id}"
    flash[:destroy] = "You destroyed a contact"
    redirect_to "/index"
    #render 'destroy.html.erb'
  end 
end
  # get '/index' => 'contacts#index'
  # get '/contacts/new' => 'contacts#new'
  # post '/contacts' => 'contacts#create'
  # get '/contacts/:id' => 'contacts#show'
  # get '/contacts/:id' => 'contacts#edit'
  # patch '/contacts/:id' => 'contacts#update'
  # delete '/contacts/:id' => 'contacts#destroy'