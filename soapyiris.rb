class Soapyiris < Formula
  desc "Soapy SDR plugin for Skylark Iris Module"
  homepage "https://github.com/skylarkwireless/sklk-soapyiris/wiki"
  head "https://github.com/skylarkwireless/sklk-soapyiris.wiki.git"

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
