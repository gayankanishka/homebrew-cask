cask "vimr" do
  version "0.52.0,20250401.183326"
  sha256 "a1c824cc294df97500dba7ee553fc22424c1473aa12f8f1665097dbdf31d4130"

  url "https://github.com/qvacua/vimr/releases/download/v#{version.csv.first}-#{version.csv.second}/VimR-v#{version.csv.first}.tar.bz2"
  name "VimR"
  desc "GUI for the Neovim text editor"
  homepage "https://github.com/qvacua/vimr"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)[._-](\d+(?:\.\d+)+)$/i)
    strategy :github_latest do |json, regex|
      match = json["tag_name"]&.match(regex)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "VimR.app"
  binary "#{appdir}/VimR.app/Contents/Resources/vimr"

  zap trash: [
    "~/Library/Caches/com.qvacua.VimR",
    "~/Library/Preferences/com.qvacua.VimR.menuitems.plist",
    "~/Library/Preferences/com.qvacua.VimR.plist",
    "~/Library/Saved Application State/com.qvacua.VimR.savedState",
    "~/Library/WebKit/com.qvacua.VimR",
  ]
end
