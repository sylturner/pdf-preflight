module Preflight
  module Profiles
    class WCAG
      include Preflight::Profile

      profile_name "wcag"

      rule Preflight::Rules::NoAlt

    end
  end
end
