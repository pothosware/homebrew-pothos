class Soapyiris < Formula
  desc "Soapy SDR plugin for Skylark Iris Module"
  homepage "https://github.com/skylarkwireless/sklk-soapyiris/wiki"
  head "https://github.com/skylarkwireless/sklk-soapyiris.wiki.git"
  url "https://github.com/skylarkwireless/sklk-soapyiris/archive/soapy-iris-2018.03.0.1.tar.gz"
  sha256 "b8281afe49c2d40c7ab310411a92f9344323d5ea7cb74b1e3032b6e13294f49f"

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
