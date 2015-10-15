class CreatePiano < ActiveInteraction::Base
  object :user, class: User
  hash :params, default: {} do 
    string :name, default: nil
  end

  def execute
    user.pianos.create(params)
  end

  def to_model
    Piano.new
  end  

  def method_missing(m, *args, &block)
    return super unless self.respond_to?(:params)
    params.fetch(m) do 
      raise NoMethodError
    end 
  end 

end
