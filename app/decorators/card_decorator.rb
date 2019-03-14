module CardDecorator
  def frame_style_label
    I18n.t('views.card.frame_style_select')
  end

  def frame_style_labels
    Card.frame_styles.map { |k, v| [I18n.t("enums.card.frame_style.#{k}"), k] }
  end

  def font_style_label
    I18n.t('views.card.font_style_select')
  end

  def font_style_labels
    Card.font_styles.map { |k, v| [I18n.t("enums.card.font_style.#{k}"), k] }
  end
end
