class Soapyhackrf < Formula
  desc "Soapy SDR plugin for Hack RF"
  homepage "https://github.com/pothosware/SoapyHackRF/wiki"
  head "https://github.com/pothosware/SoapyHackRF.git"
  url "https://github.com/pothosware/SoapyHackRF/archive/soapy-hackrf-0.3.3.tar.gz"
  sha256 "7b24a47cee42156093bf82982b4fc6184a7c86101c3b8ee450274e57ee1c4b90"

  depends_on "cmake" => :build
  depends_on "soapysdr"
  depends_on "hackrf"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
