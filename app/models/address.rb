class Address < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :address_type, optional: true
  # usar asc para crescente e desc para decrescente
  default_scope { order(street: :asc) }
  # paginação pelo kaminari
  paginates_per 10
end
