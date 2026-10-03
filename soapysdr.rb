class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  version "0.8.1-109"
  url "https://github.com/pothosware/SoapySDR/archive/1551ea0d39ce546b32a15808b9b1241018a89fc8.zip"
  sha256 "43ef5cd9ea3eea8fce30b81f175b5ffa7af799b135fe28d3dfe3fd13e5cfe224"

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
