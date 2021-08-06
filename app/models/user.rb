class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
<<<<<<< HEAD
  validates :self_introduction, length: { maximum: 500 }
  enum gender: { man: 0, woman: 1 }

  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  
=======

  validates :self_introduction, length: { maximum: 500 }

  enum gender: { man: 0, woman: 1 }

>>>>>>> 511a8dec66873d53aa27cadd6c7ebfd76ec42927
end
