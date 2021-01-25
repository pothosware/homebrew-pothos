class Soapyplutosdr < Formula
  desc "Soapy SDR plugin for PlutoSDR."
  homepage "https://github.com/pothosware/SoapyPlutoSDR"
  head "https://github.com/pothosware/SoapyPlutoSDR.git"
  url "https://github.com/pothosware/SoapyPlutoSDR/archive/soapy-plutosdr-0.2.1.tar.gz"
  sha256 "359e3762d98452b5e39078795b8165048e9edc8eb144d7c9bded7e1cc5358d4e"

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
