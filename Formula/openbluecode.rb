class Openbluecode < Formula
  desc "Expose BlueCode-authenticated models to Claude Code and Claude Desktop 3p"
  homepage "https://github.com/pengyanai/homebrew-tap"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.0/openbluecode_v0.2.0_darwin_arm64.tar.gz"
      sha256 "df14b709097e2abe4384c4cc6643924de7ec2a8b8964dad62284804817489540"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.0/openbluecode_v0.2.0_darwin_amd64.tar.gz"
      sha256 "d1ff3a0cc40d7b79caaa8fe8818959264a576ff68b0cf1d1772990cd68d3566d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.0/openbluecode_v0.2.0_linux_arm64.tar.gz"
      sha256 "ee35ac9a43cc23bd16ff390900a5d147b78e69264491bc2bf459920b8b852eab"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.0/openbluecode_v0.2.0_linux_amd64.tar.gz"
      sha256 "ec89f8472c9d65876b4f5a6b8992aee6d2a7f6000e47bed503fee0d565b5bbad"
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
