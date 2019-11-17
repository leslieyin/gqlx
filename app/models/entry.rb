# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  partition  :text
#  order      :integer
#  work_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ApplicationRecord
  belongs_to :work

  scope :ranked, -> { order("no") }
end
