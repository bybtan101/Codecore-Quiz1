class ContactController < ApplicationController

  # controller use application.html.erb inside of views/layout as the default layout, unless you specify something like: 
  # layout "special"
  # then this will use views/layouts/special.html.erb
  
  def index
    # This will render views/contact/index.html.erb
    # within layout: views/layout/application.html.erb
    # unless you specify something like:
    # render :index, layout: "special"

    # if you put something like:
    # render :abc
    # This will render: views/contact/abc.html.erb
    # instead of: views/contact/index.html.erb

    # We created index.xml.erb in views/contact
    # So if you access the page as
    # http://localhost:3000/contact.xml
    # then it will render
    # views/contact/index.xml.erb

  end

  def create
    @full_name = params[:full_name]
    @email = params[:email]
    @message = params[:message]

  end

end
