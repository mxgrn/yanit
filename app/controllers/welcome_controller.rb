class WelcomeController < ApplicationController
  def index
    render :inline => "<%= netzke :application %>", :layout => true
  end
end
