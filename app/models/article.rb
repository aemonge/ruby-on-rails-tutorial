class Article < ApplicationRecord
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :commentsEnabled, inclusion: { in: [true, false] }
  # NOTE: `presence: true` breaks the checkboxes

  # Defaults
  # BUG: :body isn't defaulting correctly on reloading the :new view, but :title is 😕
  attribute :body, default: <<~TEXT
    Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim \
    labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. \
    Nisi anim cupidatat excepteur officia. \
    Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. \
    Nostrud officia pariatur ut officia. \
    Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo \
    officia dolor Lorem duis laboris cupidatat officia voluptate.\
    Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. \
    Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. \
    Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.
  TEXT
  attribute :title, default: -> { ['Zelda is now a playable character', 'Super Mario\'s Bros movie is out!', nil].sample }

  # NOTE: Rails < 3 AKA Deprecated

  # after_initialize :set_defaults, unless: :persisted?
  # def set_defaults
  #   self.body ||= 'Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.'
  # end
end
