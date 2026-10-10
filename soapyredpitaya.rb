class Soapyredpitaya < Formula
  desc "Soapy SDR plugin for Red Pitaya"
  homepage "https://github.com/pothosware/SoapyRedPitaya/wiki"
  head "https://github.com/pothosware/SoapyRedPitaya.git"
  url "https://github.com/pothosware/SoapyRedPitaya/archive/soapy-redpitaya-0.1.2.tar.gz"
  sha256 "ccf2eef151652690fea6bd145af843332fa753a5aae9c7fa5147a5b60a72a33c"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
