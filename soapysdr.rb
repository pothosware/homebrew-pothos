class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.9.0.tar.gz"
  sha256 "64f97c1ad241156fe299acb8902169019eab34517cd580b563968a43d7533509"

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
