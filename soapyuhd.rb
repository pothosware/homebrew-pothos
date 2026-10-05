class Soapyuhd < Formula
  desc "Soapy SDR plugins for UHD devices"
  homepage "https://github.com/pothosware/SoapyUHD/wiki"
  head "https://github.com/pothosware/SoapyUHD.git"
  version "0.4.1-30"
  url "https://github.com/pothosware/SoapyUHD/archive/3a97da9401ae245e8a604af5e1e0dbb044569f0a.zip"
  sha256 "e56c8d26bff87449266ed08dd859a02ca4b2a8738c4f945a919b7e5733cadabf"

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
