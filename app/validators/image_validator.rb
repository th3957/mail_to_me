class ImageValidator < ActiveModel::EachValidator
  def initialize(options)
    options.reverse_merge!(:message => :invalid)
    super(options)
  end

  def validate_each(record, attribute, value)
    return if value.file.nil?
    white_list_content_types = ["image/jpg", "image/jpeg", "image/png", "image/x-citrix-png", "image/x-citrix-jpeg", "image/x-png", "image/pjpeg"]
    unless white_list_content_types.include?(value.file.content_type)
      record.errors.add(attribute, options[:message])
    end
  end
end
