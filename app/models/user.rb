class User
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  field :access_token, :type => String
  field :name, :type => String
  field :email, :type => String
  field :picture, :type => String

  attr_protected :provider, :uid, :access_token, :name, :email

  has_many :recipes, :dependent => :destroy

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
      if auth['credentials']
      	 user.access_token = auth['credentials']['token'] || ""
      end
      user.picture = profile.picture
    end
  end

  def friends
	  FbGraph::User.fetch(uid, :access_token => access_token).friends 
  end

  def profile
    FbGraph::User.fetch(uid, :access_token => access_token)
  end
end
