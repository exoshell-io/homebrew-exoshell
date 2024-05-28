cask "exoshell" do
  version "0.1.0"
  sha256 "2baae5b731b26f8c97d8d0ac702e7799e7427ab7cd1118975ef8ef18dd67d388"

  url "https://github.com/exoshell-dev/exoshell/releases/download/v#{version}/ExoShell_darwin_aarch64.dmg",
    verified: "github.com/exoshell-dev/exoshell/"
  name "exoshell"
  desc "Modern terminal"
  homepage "https://exoshell.io"

  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  app "ExoShell.app"
  postflight do
    system_command "/usr/bin/xattr",
      args: ["-rd", "com.apple.quarantine", "#{appdir}/ExoShell.app"]
  end

  zap trash: ""
end
