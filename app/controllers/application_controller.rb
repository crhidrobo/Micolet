class ApplicationController < ActionController::Base
  # before_action :set_locale

  # def set_locale
  #   region = request.location.region
  #   I18n.locale = region_to_locale(region)
  # end

  # def region_to_locale(region)
  #   case region
  #   when 'Region A'
  #     :en # Inglés
  #   when 'Región B'
  #     :es # Español
  #   else
  #     :en # Idioma predeterminado si la región no coincide con ninguna opción
  #   end
  # end
end
