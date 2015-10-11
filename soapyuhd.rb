class Soapyuhd < Formula
  desc "Soapy SDR plugins for UHD devices"
  homepage "https://github.com/pothosware/SoapyUHD/wiki"
  head "https://github.com/pothosware/SoapyUHD.git"
  url "https://github.com/pothosware/SoapyUHD/archive/soapy-uhd-0.2.0.tar.gz"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "boost"
  depends_on "uhd"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
