module ApplicationHelper

  def title_and_meta_tags
    title       = content_for_or_translation(:title, 'meta_title.general')
    description = content_for_or_translation(:description, 'meta_description.general')

    result = Array.new
    result << content_tag(:title, title)
    result << tag(:meta, name: 'description', content: description)
    result << content_for(:meta_tags) if content_for?(:meta_tags)
    result.join("\n").html_safe
  end

  def remove_tags_and_normalize_blanks(summary_text)
    return '' if summary_text.blank?
    summary_text.gsub(/<br\s*\/?>/, '').gsub(/\s+/, ' ')
  end

  def absolute_css_class_name
    "#{controller_name} #{action_name}"
  end

  def logo_svg(color: '#FFFFFF', width: '27px', height: '27px')
    logo = <<-"HTML"
      <svg width="#{width}" height="#{height}" viewBox="0 0 34 36" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
      <defs></defs>
      <g id="Symbols" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <g id="Mobile-Portrait" transform="translate(-9.000000, -43.000000)">
              <g id="Group" transform="translate(10.000000, 44.000000)">
                  <ellipse id="Oval" stroke="#{color}" stroke-width="2" cx="16" cy="17" rx="16" ry="17"></ellipse>
                  <circle id="Oval-2" fill="#{color}" cx="12.5" cy="12.5" r="1"></circle>
                  <circle id="Oval-2" fill="#{color}" cx="25.5" cy="9.5" r="1"></circle>
                  <path d="M13,20 C13.5750443,21.0926252 15.4341812,26.5729252 16.3985454,25.950968 C17.2707413,25.3884537 19.0086283,23.6834349 21.6122062,20.8359115 L25.2129229,24.6527114 L27,20.3588693" id="Path-3" stroke="#{color}" stroke-width="2"></path>
              </g>
          </g>
      </g>
      </svg>
    HTML
  end

  def categories
    %w(nonadult) + Site::CATEGORIES
  end

  def feed_categories
    %w(all nonadult) + Site::CATEGORIES
  end

  private

  def content_for_or_translation(content_key, translation_key)
    result = content_for?(content_key) ? content_for(content_key) : t(translation_key)
    remove_tags_and_normalize_blanks(result)
  end
end
