module AttachmentHelper

  ATTACHMENT_URL = ":mount_path:class_without_namespace/:attachment/:id.:extension"
  MISSING_IMAGE_URL = "open_badges/missing.png"

  def image_url
    Rails.application.routes.url_helpers.root_url({
      :host => Rails.application.config.default_url_options[:host]
    }).gsub(/\/$/, '') + image.url(:original, false)
  end
  
  Paperclip.interpolates :mount_path do |attachment, style|
    OpenBadges::Engine.routes.url_helpers.root_path
  end

  Paperclip.interpolates :class_without_namespace do |attachment, style|
      attachment.instance.class.name.split('::').last.downcase.pluralize
  end
end