class SelectorController < ApplicationController
  def index
    respond_to do |format|
      format.html #index.html.erb
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Harmony [Individual|Entity] Contributor [License|Assignment] Agreement", :style => :bold, :align => :center
#        pdf.render
        send_data pdf.render, :filename => "hello.pdf", 
                          :type => "application/pdf"
      end
    end
  end
end
