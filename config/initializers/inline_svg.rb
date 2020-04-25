class BasicAssetFileLoader
  def self.named(filename)
    File.open(filename, "rb") do |file|
      file.read
    end
  end
end

InlineSvg.configure do |config|
  if Rails.env.production?
    config.asset_file = InlineSvg::CachedAssetFile.new(
      paths: Rails.root.join('app', 'assets', 'icons')
    )
  else
    config.asset_file = BasicAssetFileLoader
  end

  config.svg_not_found_css_class = 'svg-icon-not-found'
end
