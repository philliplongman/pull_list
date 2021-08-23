# frozen_string_literal: true

# == Schema Information
#
# Table name: managers
#
#  id                     :bigint           not null, primary key
#  email                  :string           not null
#  encrypted_password     :string           not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_managers_on_email               (email) UNIQUE
#  index_managers_on_encrypted_password  (encrypted_password) UNIQUE
#
class Manager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable
  )

  validates :name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  validates :encrypted_password, presence: true
  validates :encrypted_password, uniqueness: true
end
