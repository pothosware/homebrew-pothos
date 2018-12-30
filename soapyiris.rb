class Soapyiris < Formula
  desc "Soapy SDR plugin for Skylark Iris Module"
  homepage "https://github.com/skylarkwireless/sklk-soapyiris/wiki"
  head "https://github.com/skylarkwireless/sklk-soapyiris.wiki.git"
  url "https://github.com/skylarkwireless/sklk-soapyiris/archive/soapy-iris-2018.12.0.1.tar.gz"
  sha256 "51d562c76b6fd70f418c136ee8905f8e9c1d58639b2acb42b0c64c51e8c95723"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "soapyremote" #runtime dependency

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
