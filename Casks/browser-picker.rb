cask "browser-picker" do
  version "21.0.12"

  on_arm do
    sha256 "cfea88884b39ee17c908cfa8d9cbef11e9c9ccca7bebe5e685ca0eae822ee099"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-arm64-#{version}.zip"
  end

  on_intel do
    sha256 "738f8e1547a3985e89a655e3c58cbe35cbcb6234224746642c90c24d269e4287"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-x64-#{version}.zip"
  end

  name "browser-picker"
  desc "Browser prompter for macOS"
  homepage "https://github.com/antonsacred/browser-picker"

  auto_updates true
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
