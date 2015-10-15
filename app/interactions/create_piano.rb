class CreatePiano < ActiveInteraction::Base
  object :user, class: User
  hash :params, default: {} do 
    string :name
  end

  def execute
    user.pianos.create(params)
  end

end
