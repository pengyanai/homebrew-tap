class Openbluecode < Formula
  desc "Expose BlueCode-authenticated models to Claude Code and Claude Desktop 3p"
  homepage "https://github.com/pengyanai/homebrew-tap"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.1.0/openbluecode_v0.1.0_darwin_arm64.tar.gz"
      sha256 "e85af7cc6f0ab295836aaa260b8d80bbbe5fa661238b84c952413706c973f8b4"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.1.0/openbluecode_v0.1.0_darwin_amd64.tar.gz"
      sha256 "8a50fd2747d49508e50ce031b168ab80074d96c14a7f8ae3d7a5d37b7f493b59"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.1.0/openbluecode_v0.1.0_linux_arm64.tar.gz"
      sha256 "4490a44dce7c6a35ffc79f109ce9f7a1c49f2a5aa7962bc13ca6032569251019"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.1.0/openbluecode_v0.1.0_linux_amd64.tar.gz"
      sha256 "c4c94af4c0ebd0cb41cc4ce36e8a916d00227121017813c5cf186e5a54110eec"
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
