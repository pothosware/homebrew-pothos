class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library."
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.6.1.tar.gz"
  sha256 "2ecf8e43518dfb24bd172923adf6ce25a6d3e39de3a8aadf26c890f60dd1e9f7"
  head "https://github.com/pothosware/SoapySDR.git"

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  def install
    mktemp do
      system "cmake", "-G", "Ninja", buildpath, *std_cmake_args
      system "ninja"
      system "cmake", "--build", ".", "--target", "install"
    end
  end

end
