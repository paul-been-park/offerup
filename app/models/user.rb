class User < ApplicationRecord
  # Direct associations

  has_many   :messages,
             :foreign_key => "prospective_buyer_id",
             :dependent => :destroy

  has_many   :listings,
             :foreign_key => "seller_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
