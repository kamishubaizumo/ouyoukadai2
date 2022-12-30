class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy


  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  



  #favorite
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
#exists?　・・・　引数で渡されたuser.idがfavoritesテーブルに存在、exists?　するか調べる。



  #検索機能
    def self.looks(search, word)
      if search == "perfect_match"
        @book = Book.where("title LIKE?","#{word}")
      elsif search == "forward_match"
        @book = Book.where("title LIKE?","#{word}%")
      elsif search == "backward_match"
       @book = Book.where("title LIKE?","%#{word}")
      elsif search == "partial_match"
       @book = Book.where("title LIKE?","%#{word}%")
      else
         @book = Book.all
      end
    end



end
