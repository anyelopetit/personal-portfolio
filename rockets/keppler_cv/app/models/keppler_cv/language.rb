# frozen_string_literal: true

# Language Model
module KepplerCv
  class Language < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    mount_uploader :image, AttachmentUploader
    acts_as_list

    def self.index_attributes
      %i[image name]
    end
  end
end
