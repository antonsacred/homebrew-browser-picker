cask "browser-picker" do
  version "21.0.14"

  on_arm do
    sha256 "50a7d85a9096c09d9f1e0a7bc59bda1fe3d00b8aaa14b06c50bedf602c7d53b7"
    url "https://github.com/antonsacred/browser-picker/releases/download/v#{version}/browser-picker-darwin-arm64-#{version}.zip"
  end

  on_intel do
    sha256 "40bc7857bbd00b16e82daccc11dc786f2b4e35d73d82efa8575aa8e7e4e1e6a4"
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
