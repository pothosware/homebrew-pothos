class Soapyairspy < Formula
  desc "Soapy SDR plugins for Airspy"
  homepage "https://github.com/pothosware/SoapyAirspy/wiki"
  head "https://github.com/pothosware/SoapyAirspy.git"
  url "https://github.com/pothosware/SoapyAirspy/archive/soapy-airspy-0.2.0.tar.gz"
  sha256 "4279ab4278fab699ef8325f3f921b2307496130a56028d33022be10916b6ccff"

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
