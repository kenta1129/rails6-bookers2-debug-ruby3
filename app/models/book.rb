class Book < ApplicationRecord

belongs_to :user
has_many :favorites, dependent: :destroy
has_many :post_comments, dependent: :destroy


  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}


def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Book.where('name LIKE ?', '%' + content)
    else
      Book.where('name LIKE ?', '%' + content + '%')
    end
end


def get_profile_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
end

def favorited_by?(user)
    favorites.exists?(user_id: user.id)
end


end
