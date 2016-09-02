class Soapyosmo < Formula
  desc "Soapy SDR plugins for OsmoSDR devices"
  homepage "https://github.com/pothosware/SoapyOsmo/wiki"
  head "https://github.com/pothosware/SoapyOsmo.git"
  url "https://github.com/pothosware/SoapyOsmo/archive/soapy-osmo-0.2.4.tar.gz"
  sha256 "7dc96d4bf4e008f021da343ea9284062655a18a827a2ad2ea0410b24f7895363"

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
