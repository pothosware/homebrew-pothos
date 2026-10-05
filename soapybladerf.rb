class Soapybladerf < Formula
  desc "Soapy SDR plugin for Blade RF"
  homepage "https://github.com/pothosware/SoapyBladeRF/wiki"
  head "https://github.com/pothosware/SoapyBladeRF.git"
  version "0.4.2-9"
  url "https://github.com/pothosware/SoapyBladeRF/archive/ab62201866f6917079d8fdbec3829ae810608595.zip"
  sha256 "ad1496d8d14d28f5fe734649fcc0562228bee543ad4f8c820946fda2d865a391"

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
