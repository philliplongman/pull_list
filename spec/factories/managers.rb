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
FactoryBot.define do
  sequence :six_plus, 6

  factory :manager do
    transient do
      number { generate :six_plus }
      as_words { number.humanize.titleize.parameterize(preserve_case: true) }
    end

    name { "Joe #{as_words}-Pack" }  # => "Joe Six-Pack", "Joe Seven-Pack", ..."Joe Twenty-Four-Pack"
    email { "joe-#{number}-pack@gmail.com" }
    password { "password" }
  end
end
