module TranslationIO
  module Content
    module Storage
      class SuffixStorage < BaseStorage
        def get_translation(locale, instance, field_name)
          instance.send("#{field_name}_#{locale}".to_sym).to_s
        end

        def set_translation(locale, instance, field_name, value)
          instance.update_column("#{field_name}_#{locale}".to_sym, value.to_s)
        end
      end
    end
  end
end