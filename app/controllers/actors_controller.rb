class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end


  def create
    a = Actor.new
    a.name = params.fetch("Name")
    a.dob = params.fetch("query_dob")
    a.bio = params.fetch("query_bio")
    a.image = params.fetch("Image")
    a.save
    
    redirect_to("/actors")
  
  end

  def destroy
    x = params.fetch("an_id")
    match = Actor.where({id: x})
    match.at(0).destroy

    redirect_to("/actors")

  end

  def update
    x = params.fetch("an_id")
    match = Actor.where({id: x})
    a = match[0]

    a.name = params.fetch("Name")
    a.dob = params.fetch("query_dob")
    a.bio = params.fetch("query_bio")
    a.image = params.fetch("Image")
    a.save
  
    redirect_to("/actors/#{a.id}")
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
