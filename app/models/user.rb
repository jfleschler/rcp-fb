class User
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  field :access_token, :type => String
  field :name, :type => String
  field :email, :type => String

  attr_protected :provider, :uid, :access_token, :name, :email

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
    end
  end
end
