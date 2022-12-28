class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}



  #favorite
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
#exists?　・・・　引数で渡されたuser.idがfavoritesテーブルに存在、exists?　するか調べる。






end
