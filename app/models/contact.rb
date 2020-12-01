class Contact < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :contact_type, optional: true
  # usar asc para crescente e desc para decrescente
  default_scope { order(name: :asc) }
  # paginação pelo kaminari
  paginates_per 10
end
