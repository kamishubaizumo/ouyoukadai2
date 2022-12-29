class Relationship < ApplicationRecord
  
    # class_name: "User"でUserモデルを参照
  #フォローしたユーザー
  belongs_to :follower, class_name: "User"
  #フォローされたユーザー
  belongs_to :followed, class_name: "User"
end
