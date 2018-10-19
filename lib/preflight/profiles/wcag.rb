module Preflight
  module Profiles
    class WCAG
      include Preflight::Profile

      profile_name "wcag"

      rule Preflight::Rules::NoAlt
      rule Preflight::Rules::Bookmarks

    end
  end
end
