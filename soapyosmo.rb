class Soapyosmo < Formula
  desc "Soapy SDR plugins for OsmoSDR devices"
  homepage "https://github.com/pothosware/SoapyOsmo/wiki"
  head "https://github.com/pothosware/SoapyOsmo.git"
  url "https://github.com/pothosware/SoapyOsmo/archive/soapy-osmo-0.2.0.tar.gz"
  sha256 "8170b74fc453a135341f87b8f83e980a196649ede8ebc6bd5086361c06500747"

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
