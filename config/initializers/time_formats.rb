Date::DATE_FORMATS[:default] = "%b %e, %Y"
Time::DATE_FORMATS[:default] = "%H:%M"
DEFAULT_DATETIME_FORMAT = "%b %e %Y %H:%M"
class DateTime 
  def to_s 
    strftime DEFAULT_DATETIME_FORMAT
  end
end