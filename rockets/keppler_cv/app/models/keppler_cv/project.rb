# frozen_string_literal: true

module KepplerCv
  # Project Model
  class Project < ApplicationRecord
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
