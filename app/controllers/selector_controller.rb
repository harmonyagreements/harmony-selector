class SelectorController < ApplicationController
  def index
    @agreement = Agreement.new

  end

  # POST /preview
  def preview
    @agreement = Agreement.create(params[:agreement])

    if params[:outboundlist]
      @agreement.outbound = params[:outboundlist].join(",")
    end

    if params[:medialist]
      @agreement.media = params[:medialist].join(",")
    end

    if params[:methodlist]
      @agreement.method = params[:methodlist].join(",")
    end

    @agreement.save

    respond_to do |format|
      format.html { @agreement }
      format.xml  { render :xml => @agreement }
    end
  end

  # POST /preview_formatted
  def preview_formatted
    @agreement = Agreement.new(params[:agreement])
    if params[:entity]
      entity = true
    else
      entity = false
    end

    respond_to do |format|
      format.html # show.html.erb
      format.pdf do
        pdf = @agreement.format_pdf(entity)
        filename = @agreement.filename_pdf(entity)

        send_data pdf.render, :filename => filename, 
                          :type => "application/pdf"
      end
    end
  end
end
