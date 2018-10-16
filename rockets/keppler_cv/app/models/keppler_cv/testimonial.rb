# frozen_string_literal: true

module KepplerCv
  # Testimonial Model
  class Testimonial < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    mount_uploader :photo, AttachmentUploader
    acts_as_list
    acts_as_paranoid

    def self.index_attributes
      %i[name charge testimonial]
    end
  end
end
