class Resume < ActiveRecord::Base

	mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :first_name, presence: true # Make sure the first name is present.
  validates :last_name, presence: true # Make sure the last name is present.
  validates :email, presence: true # Make sure the email is present.
  validates :phone, presence: true # Make sure the phone is present.

end
