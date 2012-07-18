# -*- encoding : utf-8 -*-
module ElementHelpers
  def element(selector)
    DocumentElement.new(page, selector)
  end
end

World(ElementHelpers)
