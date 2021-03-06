# == Schema Information
#
# Table name: galleries
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :integer          not null
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#
class Gallery < ApplicationRecord
  validates :title, presence: true

  belongs_to :creator,
    foreign_key: :creator_id,
    class_name: :User
    # class_name: to_s

  has_many :pictures_to_galleries,
    foreign_key: :gallery_id,
    class_name: :PicturesToGallery,
    dependent: :destroy

  has_many :pictures,
    through: :pictures_to_galleries,
    source: :picture
end
