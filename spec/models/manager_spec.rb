require "spec_helper"

# == Schema Information
#
# Table name: managers
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_managers_on_email                 (email) UNIQUE
#  index_managers_on_reset_password_token  (reset_password_token) UNIQUE
#
describe Manager, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
