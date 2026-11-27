class Openbluecode < Formula
  desc "Expose BlueCode-authenticated models to Claude Code and Claude Desktop 3p"
  homepage "https://github.com/pengyanai/homebrew-tap"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.2/openbluecode_v0.2.2_darwin_arm64.tar.gz"
      sha256 "5e2b79e3574af2367e5549cf111ef1221a64f8ab7d96e061af426440cb7dfb32"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.2/openbluecode_v0.2.2_darwin_amd64.tar.gz"
      sha256 "0c58cc119dc11b08d653d8de72f8c09d4a5ec864d5c3cb965a642668fbdc12c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.2/openbluecode_v0.2.2_linux_arm64.tar.gz"
      sha256 "da4eeaa0e6a9115c3d629e1155901fd04dc511b78587c4144aa3cd4d5081f384"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.2/openbluecode_v0.2.2_linux_amd64.tar.gz"
      sha256 "7105bf6964b546c79bb948522071fb88f9f97cecde7c5b9038ebfcf797049151"
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
