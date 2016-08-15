class Soapyairspy < Formula
  desc "Soapy SDR plugins for Airspy"
  homepage "https://github.com/pothosware/SoapyAirspy/wiki"
  head "https://github.com/pothosware/SoapyAirspy.git"

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
