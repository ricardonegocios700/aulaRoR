class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # usar asc para crescente e desc para decrescente
  default_scope { order(email: :asc) }
  # paginação pelo kaminari
  paginates_per 10
end
