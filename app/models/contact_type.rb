class ContactType < ApplicationRecord
  # usar asc para crescente e desc para decrescente
  default_scope { order(description: :asc) }
  # paginação pelo kaminari
  paginates_per 10
end
