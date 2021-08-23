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
require "rails_helper"

RSpec.describe Manager, type: :model do
  describe "validations" do
    subject { create :manager }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }

    it { should validate_presence_of(:encrypted_password) }
    it { should validate_uniqueness_of(:encrypted_password) }
  end
end
