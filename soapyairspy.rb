class Soapyairspy < Formula
  desc "Soapy SDR plugins for Airspy"
  homepage "https://github.com/pothosware/SoapyAirspy/wiki"
  head "https://github.com/pothosware/SoapyAirspy.git"
  version "0.2.0-6"
  url "https://github.com/pothosware/SoapyAirspy/archive/b3b8bdacffaf90a5f1b1bc26a133008d03112ffb.zip"
  sha256 "0cb4277bce991533f681e69492de32ec6e4438fab111d505cb4a3f152b971dd8"

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
