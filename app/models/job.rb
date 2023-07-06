class Job < ApplicationRecord
    include ImageUploader::Attachment(:attachment)
    validates :title, presence: true
end
