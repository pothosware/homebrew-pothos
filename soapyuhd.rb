class Soapyuhd < Formula
  desc "Soapy SDR plugins for UHD devices"
  homepage "https://github.com/pothosware/SoapyUHD/wiki"
  head "https://github.com/pothosware/SoapyUHD.git"
  url "https://github.com/pothosware/SoapyUHD/archive/soapy-uhd-0.4.1.tar.gz"
  sha256 "9779cce2e732cd41905b6cf8ea85edbbf51b1ac918e6180bd4891eebb4c8d085"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "boost"
  depends_on "uhd"

  def install

    args = []
    args += %W[-DUHD_ROOT='.']

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
