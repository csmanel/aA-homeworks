class Person ApplicationRecord
  validates :name, prsence: true

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :house
end