cask "browser-picker" do
  version "21.0.15"

  on_arm do
    sha256 "830335e4d36b5cb44343fa1ac77e0e4c137e806b72f1f5f5e0107701101e297f"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-arm64-#{version}.zip"
  end

  on_intel do
    sha256 "6ce312128c5f09e02f6c323f7dfa32b3cb4a55e6f6ae6e1de4b2183204219a4f"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-x64-#{version}.zip"
  end

  name "browser-picker"
  desc "Browser prompter for macOS"
  homepage "https://github.com/antonsacred/browser-picker"

  depends_on macos: :monterey

  app "browser-picker.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/browser-picker.app"]
    system_command "/usr/bin/codesign", args: ["--force", "--deep", "--sign", "-", "#{appdir}/browser-picker.app"]
  end

  uninstall quit: "com.browser-picker"

  zap trash: [
    "~/Library/Application Support/browser-picker",
    "~/Library/Preferences/com.browser-picker.plist",
    "~/Library/Saved Application State/com.browser-picker.savedState",
  ]
end
