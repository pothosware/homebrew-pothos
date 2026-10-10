class Soapybladerf < Formula
  desc "Soapy SDR plugin for Blade RF"
  homepage "https://github.com/pothosware/SoapyBladeRF/wiki"
  head "https://github.com/pothosware/SoapyBladeRF.git"
  url "https://github.com/pothosware/SoapyBladeRF/archive/soapy-bladerf-0.4.3.tar.gz"
  sha256 "05e26ba4172e19953f052812252dafb3ee2cb703ecab1e7c6da811e77cf6edf2"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "libbladerf"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
