class PumaDev < Formula
  desc "A tool to manage rack apps in development with puma"
  homepage "https://github.com/puma/puma-dev"
  url "https://github.com/basecamp/puma-dev/releases/download/v0.10.1/puma-dev-0.10.5c92d48.zip"
  sha256 "72efce4dda3f80d7840c355a322a298c6b41f439fdd0bca4d63d4e03a6bca4ea"
  version '0.10.1'

  def install
    bin.install "puma-dev"
  end

  test do
    require 'open3'
    puma_dev_bin = "#{bin}/puma-dev"
    ::Open3.popen3("#{puma_dev_bin} -h") do |_, _, stderr|
      assert_equal "Usage of #{puma_dev_bin}:", stderr.readlines.first.strip
    end
  end

  def caveats
    <<-EOS.undent
      Setup dev domains:
        sudo puma-dev -setup

      Install puma-dev as a launchd agent (required for port 80 usage):
        puma-dev -install

      To update to the latest release:
        puma-dev -install
    EOS
  end
end

