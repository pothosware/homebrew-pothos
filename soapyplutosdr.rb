class Soapyplutosdr < Formula
  desc "Soapy SDR plugin for PlutoSDR."
  homepage "https://github.com/pothosware/SoapyPlutoSDR"
  head "https://github.com/pothosware/SoapyPlutoSDR.git"
  version "0.2.2-13"
  url "https://github.com/pothosware/SoapyPlutoSDR/archive/6d93ba806e4b2d2e1c5c70c9ba82027b37bdb257.zip"
  sha256 "ef3cf3837d0db53ec58828bf16223e8dc4b6d1a5b1a82fd3fd99e06cbd03a09d"

  depends_on "soapysdr"
  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "libiio"
  depends_on "libad9361"
  depends_on "soapysdr"

  def install
    libiio = Formulary.factory 'libiio'
    libad9361 = Formulary.factory 'libad9361'

    mktemp do
      system "cmake", "-G", "Ninja", buildpath,
             "-DCMAKE_FRAMEWORK_PATH=#{libad9361.opt_prefix};#{libiio.opt_prefix}",
             *std_cmake_args
      system "ninja"
      system "cmake", "--build", ".", "--target", "install"
    end
  end

end
