class Recipe <ActiveRecord::Base
  belongs_to :chef
  has_many :likes
  validates :chef_id, presence: true
  validates :name, presence: true, length:{minimum:5 ,maximum:100}
  validates :summary, presence: true, length:{minimum:10, maximum:150}
  validates :description, presence: true, length:{minimum:20, maximum:500}
  mount_uploader :picture,  PictureUploader
  #picture size validation
  validate :picture_size

  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
      self.likes.where(like: false).size
  end

   private
   def picture_size
     if picture.size > 5.megabytes
       errors.add(:picture, "should be less than 5MB")
     end #this takes care of only on the server side, on the broweser side it should also be validated...i.e _form.html.erb, a jquery is used to do that
   end
end
