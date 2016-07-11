class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.5.0.tar.gz"
  sha256 "392bbcfefb543663819c3e0d2981ada4f0e45df36cd5df8bb72f7e82aebc59ed"

  depends_on "cmake" => :build
  depends_on "swig" => :build
  depends_on "python3" => :optional

  def install

    args = []

    if build.with?("python3")
      args += ["-DENABLE_PYTHON3=ON"]
    else
      args += ["-DENABLE_PYTHON3=OFF"]
    end

    if !(build.head?)
      args += ["-DSOAPY_SDR_EXTVER=release"]
    end

    args += %W[-DSOAPY_SDR_ROOT='#{HOMEBREW_PREFIX}']

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
