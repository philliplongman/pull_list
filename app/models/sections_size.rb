# == Schema Information
#
# Table name: sections_sizes
#
#  id         :bigint           not null, primary key
#  section_id :bigint           not null
#  size_id    :bigint           not null
#
# Indexes
#
#  index_sections_sizes_on_section_id              (section_id)
#  index_sections_sizes_on_section_id_and_size_id  (section_id,size_id) UNIQUE
#  index_sections_sizes_on_size_id                 (size_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id) ON DELETE => cascade
#  fk_rails_...  (size_id => sizes.id) ON DELETE => cascade
#

class SectionsSize < ApplicationRecord
  belongs_to :section
  belongs_to :size

  validates :section, presence: true
  validates :size,    presence: true
  validates :size,    uniqueness: { scope: :section }

end
