class Soapyairspy < Formula
  desc "Soapy SDR plugins for Airspy"
  homepage "https://github.com/pothosware/SoapyAirspy/wiki"
  head "https://github.com/pothosware/SoapyAirspy.git"
  url "https://github.com/pothosware/SoapyAirspy/archive/soapy-airspy-0.1.2.tar.gz"
  sha256 "3c0bafd27063df1cbc7913c0b5d3d1d9a0624d25d290f0818261ae52d0f29ee8"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "airspy"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
