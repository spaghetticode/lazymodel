class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def validate
    @person = Person.new(params[:person])
    flash[:notice] = "Person is #{'not ' unless @person.valid?}valid"
    render :action => 'new'
  end
end
