class Soapyuhd < Formula
  desc "Soapy SDR plugins for UHD devices"
  homepage "https://github.com/pothosware/SoapyUHD/wiki"
  head "https://github.com/pothosware/SoapyUHD.git"
  url "https://github.com/pothosware/SoapyUHD/archive/soapy-uhd-0.3.4.tar.gz"
  sha256 "7b7f2bc9a565f42b6e9b0831db942a5231fd048c79976fb2d1f1710efef83dd0"

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
