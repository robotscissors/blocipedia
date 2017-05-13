class WikiPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def update?
    #users should be able to update their own records (public or private)
    return true if (user.id === wiki.user_id)
    #users should be able update any wiki that is public
    return true if (user.present? && !wiki.private)
    
  end
end
