cask "exoshell" do
  homepage "https://exoshell.io"
  name "exoshell"
  desc "Modern terminal"
  version "0.1.0"

  arch arm: "aarch64", intel: "x86_64"

  url "https://github.com/exoshell-dev/exoshell/releases/download/v#{version}/ExoShell_darwin_#{arch}.dmg",
    verified: "github.com/exoshell-dev/exoshell/"

  sha256 arm: "2baae5b731b26f8c97d8d0ac702e7799e7427ab7cd1118975ef8ef18dd67d388",
    intel: "76235eba606d2a55f7bdcb4eb49097ceaab635a0c661431077adf1f6598b64c5"

  app "ExoShell.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-rd", "com.apple.quarantine", "#{appdir}/ExoShell.app"]
  end

  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end
end
