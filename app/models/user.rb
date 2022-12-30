class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_one_attached :profile_image
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy


#フォロー機能 ////////////////////////////////////////
  # フォローを与する
has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 # フォローを被される
has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy


# 被フォロー関係を通じて参照　→　自分をフォローしている人
has_many :followings, through: :relationships, source: :followed

#　与フォロー関係を通じて参照 →　自分がフォローしている人
has_many :followers, through: :reverse_of_relationships, source: :follower
#///////////////////////////////////////

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: {maximum: 50}


#プロフィール画像
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end




#フォロー、フォロワー

# フォローしたときの処理
  def follow(user)
    relationships.create(followed_id: user.id)
  end
# フォローを外すときの処理
  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end
# フォローしているか判定
  def following?(user)
    followings.include?(user)
  end



  #検索機能
    def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
    end

end