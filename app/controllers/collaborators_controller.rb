class CollaboratorsController < ApplicationController

  def create
    #create an entry in the collaborator table
    #collaborator = @user.collaborator.build(wiki: wiki)
    @collaborator = Collaborator.new(collaborator_params)
    #@collaborator.user_id = params[:user_id]
    #@collaborator.wiki_id = params[:wiki_id]

    if @collaborator.save
      flash[:notice] = "You added a collaborator!"
      redirect_to :back
    else
      flash.now[:alert] = "There was an error saving the collaborator. Please try again."
      redirect_to :back
      end
  end


  def destroy
    @collaborator = Collaborator.where(:wiki_id => params[:id], :user_id => params[:user_id])
    if @collaborator.destroy_all
      flash[:notice] = "The collaborator was removed!"
      redirect_to :back
    else
      flash[:alert] = "Oops! Something happened and we weren't able to delete the collaborator."
      redirect_to :back
    end
  end

  private
  # Using a private method to encapsulate the permissible parameters
  def collaborator_params
    params.require([:wiki_id, :user_id])
  end
end
