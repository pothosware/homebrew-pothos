class Soapyairspy < Formula
  desc "Soapy SDR plugins for Airspy"
  homepage "https://github.com/pothosware/SoapyAirspy/wiki"
  head "https://github.com/pothosware/SoapyAirspy.git"
  url "https://github.com/pothosware/SoapyAirspy/archive/soapy-airspy-0.2.1.tar.gz"
  sha256 "6170c8462a026282c48b89cadf70d93b671999b3930267442a1754e2a67248f2"

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
