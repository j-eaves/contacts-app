class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render 'all_contacts.html.erb'
  end
  def show_me_the_contact
    @contact = Contact.first
    render 'the_contact.html.erb'
  end
end
