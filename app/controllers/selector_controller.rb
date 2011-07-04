class SelectorController < ApplicationController
  def index
    @agreement = Agreement.new

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

  def generate
    respond_to do |format|
      format.html #generate.html.erb
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Harmony [Individual|Entity] Contributor [License|Assignment] Agreement", :style => :bold, :align => :center
#        pdf.render
        send_data pdf.render, :filename => "retry.pdf", 
                          :type => "application/pdf"
      end
    end
  end

  # POST /preview
  def preview
    @agreement = Agreement.new(params[:agreement])
    @agreement.outbound = params[:outboundlist].join(",")
    @agreement.media = params[:medialist].join(",")
    method = params[:methodlist]
    if method.length > 1
      method[-1] = "or " + method[-1]
    end
    if method.length == 2
      @agreement.method = method.join(" ")
    else
      @agreement.method = method.join(", ")
    end

    respond_to do |format|
      format.html { @agreement }
      format.xml  { render :xml => @agreement }
    end
  end

  # POST /preview_formatted
  def preview_formatted
    @agreement = Agreement.new(params[:agreement])
    @type = params[:type]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agreement }
    end
  end
end
