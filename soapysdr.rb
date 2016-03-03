class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.4.2.tar.gz"
  sha256 "eb17ce5116dd1acd6260fd7659c9e1f97ea097b490851c5298be9e80c35af64d"

  depends_on "cmake" => :build
  depends_on "swig" => :build

  def install
    mkdir "build" do
      args = %W[
        -DSOAPY_SDR_ROOT='#{HOMEBREW_PREFIX}'
      ] + std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
