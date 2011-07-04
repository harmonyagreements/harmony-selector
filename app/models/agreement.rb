class Agreement < ActiveRecord::Base
  def new_pdf
      @pdf = Prawn::Document.new
  end
end
