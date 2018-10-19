module Preflight
  module Rules
    class NoAlt
      attr_reader :issues

      def page=(page)
        page.objects.each do |name, stream|
          begin
            type = stream[:S]
            case type
            when :Figure
              if missing_alt_tag?(stream)
                @issues = [Issue.new("Applying text alternatives to images with the Alt entry",
                                     self,
                                     page_number: page.number,
                                     code: "PDF1",
                                     stream: stream)]
              end
            end
          rescue
            nil
          end
        end
      end

      def missing_alt_tag?(obj)
        obj[:Alt].nil? || obj[:Alt].empty?
      end
    end
  end
end
