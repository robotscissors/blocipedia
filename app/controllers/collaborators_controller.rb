class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:wiki_id])
    #@user = User.find(params[:id])
    #collaborator = @user.collaborator.build(wiki: wiki)
    flash[:notice] = "You added a collaborator!"
    redirect_to :back

  end


  def destroy
  end
end
