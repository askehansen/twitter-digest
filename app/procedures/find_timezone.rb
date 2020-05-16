module FindTimezone

  def self.find(name)
    from_mapping(name) || from_offset(name)
  end

  private

  def self.from_mapping(name)
    mapping = ActiveSupport::TimeZone::MAPPING.key(name)
    ActiveSupport::TimeZone.new(mapping.to_s)
  end

  def self.from_offset(name)
    tzinfo = TZInfo::Timezone.get(name)
    ActiveSupport::TimeZone[tzinfo.period_for_utc(Time.now.utc).utc_offset]
  rescue TZInfo::InvalidTimezoneIdentifier
    nil
  end

end
