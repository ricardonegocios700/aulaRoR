class Person < ApplicationRecord
  #has_many :person_types
  belongs_to :shift, optional: true
  #USADO NAS PARTIALS INIC
  has_many :addresses, dependent: :destroy, inverse_of: :person
  accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: :all_blank, allow_destroy: true
  has_many :contacts,  dependent: :destroy, inverse_of: :person
  accepts_nested_attributes_for :contacts,  allow_destroy: true, reject_if: :all_blank, allow_destroy: true
  #USADO NAS PARTIALS FIM
  # usar asc para crescente e desc para decrescente
  default_scope { order(name: :asc) }
  # paginação pelo kaminari
  paginates_per 10

end
