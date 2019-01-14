module CardDecorator
  def frame_style_label
    I18n.t('activerecord.attributes.card.frame_style')
  end

  def frame_style_labels
    Card.frame_styles.map { |k, v| [I18n.t("enums.card.frame_style.#{k}"), k] }
  end

  def font_style_label
    I18n.t('activerecord.attributes.card.font_style')
  end

  def font_style_labels
    Card.font_styles.map { |k, v| [I18n.t("enums.card.font_style.#{k}"), k] }
  end
end
