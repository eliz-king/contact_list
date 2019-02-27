class Contact < ApplicationRecord
  # Associations
  # belongs_to
  # has_many
  # has_one
  # has_many :through
  # has_one :through
  # deendent

  has_many :notes, dependant: :destroy
  # has_one :note
  has_one :address, dependant: :destroy

  # # Validations
  # confirmation
  validates :password, confirmation: true
    # inside of a form
    # <%= text_field :password, %>
    # <%= text_field :password_confirmation, %>
  # inclusion
    #class Coffee < ActiveRecord::Base
    #  validates :size, inclusion: { 
    #    in: %w(small medium large),
    #      message: "%{value} is not a valid size" 
    #   }
    # end
  # length
    # validates :phone, length: {maximum: 10}
    # validates :phone, length: {minimum: 7}
  validates :phone, length: {in 7..10}
    # validates :phone, length: { is 7 }
  # numericality
    # validates :age, numericality: true
    # validates :age, numericality: { only_integer: true}
  validates :age, numericality: {
    greater_than_or_equal_to: 21, 
    less_than_or_equal_to: 150,
  }
  # presence
  validates 
    :age, 
    :phone, 
    :email, 
    :first_name, 
    :last_name, 
  presence: true, on: create
  # on: update
  # on: save

  # uniqueness
  validates :email, uniqueness: true, allow_nil: true, allow_blank: false

  # Validation Options
    # allow_nil
      # true or false (doesn't exist)
    # allow_blank
      # true or false (empty string)
    # message
    # on


# Callbacks
  # before_validation
  # after_valdation
  # before_save
  # after_save
  # around_save
  # before_create
  # after_create
  # around_create

  before_save :set_age

  private
    def set_age
      self.age = 18
    end

    # serialize :cart, Array
    # cart[ ]


    # class methods
      # contact.by_first_name
      def self.by_first_name
        order(:first_name)
      end

    # instance methods
      #@person.full_name
      def full_name
        "#{self.first_name} #{self.last_name}"
      end


end
