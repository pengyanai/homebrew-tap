class Openbluecode < Formula
  desc "Expose BlueCode-authenticated models to Claude Code and Claude Desktop 3p"
  homepage "https://github.com/pengyanai/homebrew-tap"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.9/openbluecode_v0.2.9_darwin_arm64.tar.gz"
      sha256 "41ec8460131e29de4baa2aa2e791d1aea99fd0da5c5d6ce6bfb08e979cd1ef88"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.9/openbluecode_v0.2.9_darwin_amd64.tar.gz"
      sha256 "1b90d4104b2f547e00ddd10f79acdb86f96a72e7f206403d8e14fde60dc0ba96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.9/openbluecode_v0.2.9_linux_arm64.tar.gz"
      sha256 "216a97edd936026dc4e786bec77bd2ec1cb8676d8c921432f78265600e92aa8d"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.9/openbluecode_v0.2.9_linux_amd64.tar.gz"
      sha256 "f366d310e8e6689c39a8e7b7c314eb1d052f09f1ce9ba66a6e8d7287ef5895b6"
    end
  end

  def install
    bin.install Dir["openbluecode_*"].first => "openbluecode"
  end

  def caveats
    <<~EOS
      Finish setup (register the login item and print client config):

        openbluecode install

      Then open http://127.0.0.1:18981 and pick a model per tier.
    EOS
  end

  test do
    assert_match "openbluecode", shell_output("#{bin}/openbluecode version")
  end
end
