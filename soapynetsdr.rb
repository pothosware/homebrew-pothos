class Soapynetsdr < Formula
  desc "Soapy SDR plugin for Net SDRs"
  homepage "https://github.com/pothosware/SoapyNetSDR/wiki"
  head "https://github.com/pothosware/SoapyNetSDR.git"
  version "0.2.0-11"
  url "https://github.com/pothosware/SoapyNetSDR/archive/5d1d5da84a9bc782803072058b91fc6529f7593f.zip"
  sha256 "a3f11f3a6c2829718db0ac62a08e91230cc79518eb609a0ba56a99eff14555cc"

  depends_on "cmake" => :build
  depends_on "soapysdr"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
