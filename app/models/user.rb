class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    info = auth['info']
    #convert from 64bit to 32bit
    # While authenticating via Steam, the user’s 64-bit uID will be returned.
    # However, when listing Dota 2 matches, the user’s 32-bit ids are used, instead.
    user = find_or_initialize_by( uid: (auth['uid'].to_i - 76561197960265728).to_s )
    user.nickname = info['nickname']
    user.avatar_url = info['image']
    user.profile_url = info['urls']['Profile']
    user.save!
    user
  end

end
