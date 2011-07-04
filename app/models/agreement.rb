class Agreement < ActiveRecord::Base
  def new_pdf
      @pdf = Prawn::Document.new
  end

  def format_method
      fmt = self.method.split(",")
      if fmt.length > 1
        fmt[-1] = "or " + fmt[-1]
      end
      if fmt.length == 2
        return fmt.join(" ")
      else
        return fmt.join(", ")
      end
  end

  def format_license(raw)
      if raw == ''
        return nil
      end

      rawlist = raw.split(",")
      fmt = []
      rawlist.each do |l|
        license = License.find_by_spdx(l)
        fmt.push(license.name)
      end
      if fmt.length > 1
        fmt[-1] = "or " + fmt[-1]
      end
      if fmt.length == 2
        return fmt.join(" ")
      else
        return fmt.join(", ")
      end
  end

  def format_outbound
    return self.format_license(self.outbound)
  end

  def format_media
    return self.format_license(self.media)
  end

end
