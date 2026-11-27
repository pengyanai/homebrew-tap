class Openbluecode < Formula
  desc "Expose BlueCode-authenticated models to Claude Code and Claude Desktop 3p"
  homepage "https://github.com/pengyanai/homebrew-tap"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.5/openbluecode_v0.2.5_darwin_arm64.tar.gz"
      sha256 "15e0246fb3ab13e2c0c695c84d609935d550b91f919f239a3233db1b95b2a153"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.5/openbluecode_v0.2.5_darwin_amd64.tar.gz"
      sha256 "c4caf98cc73c45c4363435ee0acf1c36df824eac7a0d24951a3d7027e12f7844"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.5/openbluecode_v0.2.5_linux_arm64.tar.gz"
      sha256 "1ff96408068af551b6f45ea21a1b780ff399f90cd1e567aa701e13c97895044f"
    else
      url "https://github.com/pengyanai/homebrew-tap/releases/download/openbluecode-0.2.5/openbluecode_v0.2.5_linux_amd64.tar.gz"
      sha256 "192ce874e8f14f26df1e1d4319deec62051ca567accd2713c1c63a15c538495a"
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
