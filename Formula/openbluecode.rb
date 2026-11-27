class Openbluecode < Formula
  desc "Expose BlueCode-authenticated models to Claude Code and Claude Desktop 3p"
  homepage "https://github.com/pengyanai/homebrew-tap"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.7/openbluecode_v0.2.7_darwin_arm64.tar.gz"
      sha256 "2582190aa709f75e2487554125d3e192a9c60c4fb5c8c23ccc2c1c5f599080f7"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.7/openbluecode_v0.2.7_darwin_amd64.tar.gz"
      sha256 "9dfb9b91bc1a2b0106d4d37236f64cff97868c828e0fde39f2db2547ecba2024"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.7/openbluecode_v0.2.7_linux_arm64.tar.gz"
      sha256 "11a5176c2e5c20c3f686c07cda0ba7208d5ece125c2f9eb2b8b722fe4ac02185"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.7/openbluecode_v0.2.7_linux_amd64.tar.gz"
      sha256 "1a94342e4d36e40ea56f6141cf78237f9b12d6056bc0b41a0252544464677fdf"
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
