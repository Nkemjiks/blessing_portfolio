module PageTitle
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Blessing Mbonu | Portfolios"
    @seo_keywords = "Blessing Mbonu Portfolio"
  end
end
