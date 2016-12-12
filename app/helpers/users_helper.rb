module UsersHelper
	def number_to_phone(number, options = {})
        return unless number
        options = options.symbolize_keys

        parse_float(number, true) if options.delete(:raise)
        ERB::Util.html_escape(ActiveSupport::NumberHelper.number_to_phone(number, options))
      end
end
