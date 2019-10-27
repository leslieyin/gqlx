# == Schema Information
#
# Table name: works
#
#  id            :integer          not null, primary key
#  title         :string
#  dynasty       :string
#  author        :string
#  prelude       :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  notes         :string           default("{}"), is an Array
#  translate     :string           default("{}"), is an Array
#  translate_res :string           default("{}"), is an Array
#  content       :string           default("{}"), is an Array
#

class Work < ApplicationRecord
  validates :title, :dynasty, :author, :content, presence: true

  before_save :remove_blank_attribute_assign

  def self.fetch_type(type)
    if type&.include?("唐诗")
      TangPoem.name
    elsif type&.include?("宋词")
      SongPoem.name
    else
      Article.name
    end
  end

  def remove_blank_attribute_assign
    self.content.reject!(&:blank?)
    self.notes.reject!(&:blank?)
    self.translate.reject!(&:blank?)
    self.translate_res.reject!(&:blank?)
  end
end
