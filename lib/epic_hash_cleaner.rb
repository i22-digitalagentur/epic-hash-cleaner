Dir[File.join(__dir__, 'epic_hash_cleaner/*.rb')].each { |path| require path }

module EpicHashCleaner
  module_function

  def clean(hash)
    return {} if hash.nil?
    clean_hash(hash)
  end

  def clean_hash(hash)
    hash.delete_if { |_, v| clean_value(v) }
  end

  def clean_array(array)
    array.delete_if { |v| clean_value(v) }
  end

  def clean_value(value)
    clean_hash(value)  if value.is_a?(Hash)
    clean_array(value) if value.is_a?(Array)
    blank?(value) if value != false
  end

  # blank? has different meaning depending on the class
  # See https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/object/blank.rb
  #
  # we use directly #blank? if defined, if not we replicate the active support
  # implementation for Object#blank?
  #
  # rubocop:disable Style/DoubleNegation
  def blank?(value)
    return value.blank? if value.respond_to?(:blank?)

    value.respond_to?(:empty?) ? !!value.empty? : !value
  end
  # rubocop:enable Style/DoubleNegation
end
