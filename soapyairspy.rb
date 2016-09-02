class Soapyairspy < Formula
  desc "Soapy SDR plugins for Airspy"
  homepage "https://github.com/pothosware/SoapyAirspy/wiki"
  head "https://github.com/pothosware/SoapyAirspy.git"
  url "https://github.com/pothosware/SoapyAirspy/archive/soapy-airspy-0.1.0.tar.gz"
  sha256 "83e6318a0735eefd6383bc0606bf87188cf03219e688ced6b0c79c312775fab4"

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
