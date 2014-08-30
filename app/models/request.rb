class Request < ActiveRecord::Base
  belongs_to :requester, class_name: 'User'
  belongs_to :requested, class_name: 'User'

  def accept
    requester.friends << requested
    self.destroy
  end
end
