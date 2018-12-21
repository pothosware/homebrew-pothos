class Soapyplutosdr < Formula
  desc "Soapy SDR plugin for PlutoSDR."
  homepage "https://github.com/pothosware/SoapyPlutoSDR"
  head "https://github.com/pothosware/SoapyPlutoSDR.git"
  url "https://github.com/pothosware/SoapyPlutoSDR/archive/soapy-plutosdr-0.1.0.tar.gz"
  sha256 "d468803f603b78fad91e271f6718630a21d591d732349b568b515458a2d67d8d"

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
