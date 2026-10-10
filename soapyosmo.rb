class Soapyosmo < Formula
  desc "Soapy SDR plugins for OsmoSDR devices"
  homepage "https://github.com/pothosware/SoapyOsmo/wiki"
  head "https://github.com/pothosware/SoapyOsmo.git"
  url "https://github.com/pothosware/SoapyOsmo/archive/soapy-osmo-0.2.6.tar.gz"
  sha256 "1be3196a922e1645c6992a30707dfb8ed38d11d950369f0a50f6a87bafdbd16f"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "boost"
  depends_on "libmirisdr"
  depends_on "libosmosdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
