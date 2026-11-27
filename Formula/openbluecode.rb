class Openbluecode < Formula
  desc "Expose BlueCode-authenticated models to Claude Code and Claude Desktop 3p"
  homepage "https://github.com/pengyanai/homebrew-tap"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.6/openbluecode_v0.2.6_darwin_arm64.tar.gz"
      sha256 "07a925dacff1d8a86ec088a14693ce104d459d4aa7614339b116a43b37389a7a"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.6/openbluecode_v0.2.6_darwin_amd64.tar.gz"
      sha256 "4ddd76e5067366838d602df6767b35b5d0d53e32465ccaf65a6838fe7edc1de5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.6/openbluecode_v0.2.6_linux_arm64.tar.gz"
      sha256 "d7e59e0958a92ae16676e2cafc7d9d264535741343c6883251fb3985b5f3bd12"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.6/openbluecode_v0.2.6_linux_amd64.tar.gz"
      sha256 "0f082e3ab1395fd4a00b126fa72ddc3fd34082bb34cf6c069f0b8f0eeae68e4f"
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
