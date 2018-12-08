class Soapyrtlsdr < Formula
  desc "Soapy SDR module for RTL-SDR"
  homepage "https://github.com/pothosware/SoapyRTLSDR/wiki"
  head "https://github.com/pothosware/SoapyRTLSDR.git"
  url "https://github.com/pothosware/SoapyRTLSDR/archive/soapy-rtlsdr-0.3.0.tar.gz"
  sha256 "9c31c67c2646628b448bbef1307f3880b7e78be8caf7a02cd3cfa4d08dc4075b"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "librtlsdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
