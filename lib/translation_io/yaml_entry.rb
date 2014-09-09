module YamlEntry

  IGNORED_KEY_PREFIXES = [
    'faker.'
  ]

  LOCALIZATION_KEY_PREFIXES = [
    'date.formats',
    'date.order',
    'time.formats',
    'support.array',
    'number.format',
    'number.currency',
    'number.percentage',
    'number.precision',
    'number.human.format',
    'number.human.storage_units.format',
    'number.human.decimal_units.format',
    'number.human.decimal_units.units.unit'
  ]

  class << self
    def string?(key, value)
      key.present? && value.is_a?(String)
    end

    def from_locale?(key, locale)
      key.present? && key.start_with?("#{locale}.")
    end

    def ignored?(key)
      key.present? && IGNORED_KEY_PREFIXES.any? { |p| key_without_locale(key).start_with?(p) }
    end

    def localization?(key, value)
      key.present? && (localization_prefix?(key) || (!YamlEntry.string?(key, value) && !value.nil?))
    end

    def localization_prefix?(key)
      LOCALIZATION_KEY_PREFIXES.any? do |prefix|
        key_without_locale(key).start_with?(prefix)
      end
    end

    private

    def key_without_locale(key)
      key.split('.', 2).last
    end
  end
end