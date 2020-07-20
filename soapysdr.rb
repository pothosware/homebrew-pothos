class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.7.2.tar.gz"
  sha256 "6eb4143fed115911884bdbbe6fe32dbd99b4ada210c9e126ac3c49c24414347a"

  depends_on "cmake" => :build
  depends_on "swig" => :build
  depends_on "python2" => :optional
  depends_on "python" => :recommended

  def install

    args = []

    if build.with?("python2")
        args += ["-DENABLE_PYTHON=ON"]
        args += ["-DUSE_PYTHON_CONFIG=ON"]
    else
        args += ["-DENABLE_PYTHON=OFF"]
    end

    if build.with?("python")
      args += ["-DENABLE_PYTHON3=ON"]
      args += ["-DCMAKE_MODULE_LINKER_FLAGS_INIT='-undefined dynamic_lookup'"]
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
