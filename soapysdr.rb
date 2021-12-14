class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.8.1.tar.gz"
  sha256 "a508083875ed75d1090c24f88abef9895ad65f0f1b54e96d74094478f0c400e6"

  depends_on "cmake" => :build
  depends_on "swig" => :build
  depends_on "python" => :recommended

  def install

    args = ["-DENABLE_PYTHON=OFF"]

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
