module ApplicationHelper
  def icon(name, options={})
    size = options.delete(:size) || 16
    colored = options.delete(:colored)
    options[:data] = { name: name }

    options[:class] = "#{options[:class]} #{'svg-icon-current-color' unless colored} svg-icon svg-icon-#{size}"
    inline_svg_tag("#{Rails.root}/app/assets/icons/#{size}/#{name}.svg", options)
  end
end
