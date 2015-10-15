class Piano < ActiveRecord::Base
  attr_accessor :params
  belongs_to :user
end
