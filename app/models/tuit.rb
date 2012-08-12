class Tuit < ActiveRecord::Base
  attr_accessible :contenido
  belongs_to :usuario

  validates :usuario_id, presence: true
  validates :contenido, presence: true, length: { maximum: 140 }
  default_scope order: "tuits.created_at DESC"
end
