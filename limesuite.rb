class Limesuite < Formula
  desc "Lime suite device drivers, GUI, and SDR support"
  homepage "https://github.com/myriadrf/LimeSuite/blob/master/README.md"
  head "https://github.com/myriadrf/LimeSuite.git"

  depends_on "cmake" => :build
  depends_on "libusb" => :recommended
  depends_on "wxwidgets" => :recommended
  depends_on "soapysdr" => :recommended

  def install
    args = []

    if build.with?("libusb")
      args += ["-DENABLE_STREAM=ON"]
    else
      args += ["-DENABLE_STREAM=OFF"]
    end

    if build.with?("wxwidgets")
      args += ["-DENABLE_LMS7_GUI=ON"]
    else
      args += ["-DENABLE_LMS7_GUI=OFF"]
    end

    #novena is arm linux only
    args += ["-DENABLE_NOVENARF7=OFF"]

    if build.with?("soapysdr")
      args += ["-DENABLE_SOAPY_LMS7=ON"]
    else
      args += ["-DENABLE_SOAPY_LMS7=OFF"]
    end

    mkdir "builddir" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
