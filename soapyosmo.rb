class Soapyosmo < Formula
  desc "Soapy SDR plugins for OsmoSDR devices"
  homepage "https://github.com/pothosware/SoapyOsmo/wiki"
  head "https://github.com/pothosware/SoapyOsmo.git"
  url "https://github.com/pothosware/SoapyOsmo/archive/soapy-osmo-0.2.0.tar.gz"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "boost"
  depends_on "airspy"
  depends_on "libmirisdr"
  depends_on "libosmosdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
