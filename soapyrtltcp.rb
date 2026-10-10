class Soapyrtltcp < Formula
  desc "Soapy SDR module for RTLTCP protocol"
  homepage "https://github.com/pothosware/SoapyRTLTCP/wiki"
  head "https://github.com/pothosware/SoapyRTLTCP.git"
  url "https://github.com/pothosware/SoapyRTLTCP/archive/soapy-rtltcp-0.1.1.tar.gz"
  sha256 "2b709001e0212b4f7b0243516550720bce0ed96456cc4bbfcb44bb8a048f621a"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
