module Preflight
  module Rules
    class Bookmarks
      attr_reader :issues

      def page=(page)
        count = 0

        page.objects.each do |name, stream|
          begin
            count = stream[:Count] if stream[:Type] == :Outlines
          rescue
            nil
          end
        end

        if count == 0
          @issues = [Issue.new("Creating bookmarks in PDF documents",
                                       self,
                                       page_number: page.number,
                                       code: "PDF2")]
        end
      end
    end
  end
end
