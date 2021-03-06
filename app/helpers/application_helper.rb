module ApplicationHelper
  include AuthHelper

  def item(tag, name, path, link_options = {})
    options = {}
    options[:class] = :active if current_page?(path)
    link = link_to(name, path, link_options)
    content_tag(:li, link, options)
  end

  def item_page(tag, page, link_options = {})
    path = page_path(page)
    item(tag, page, path, link_options)
  end

  def member_state_t(state)
    t("activerecord.state_machines.member.state.states.#{state}")
  end

  def can_registred?
    end_time = Time.zone.parse( configus.end_reg_time )
    Time.current <= end_time
  end

  def truncate_sanitize_rem_br(text, length)
    return '' if text.blank?
    truncate( sanitize(text, :tags => []), :length => length ).gsub(/\r/, "").gsub(/\n/, "").gsub(/&[a-z]{0-5}\.\.\.$/, "...")
  end

end
