class Libiio < Formula
  desc "Library for interfacing with IIO devices."
  homepage "https://wiki.analog.com/software/linux/docs/iio/iio"
  url "https://github.com/analogdevicesinc/libiio/archive/v0.26.tar.gz"
  sha256 "fb445fb860ef1248759f45d4273a4eff360534480ec87af64c6b8db3b99be7e5"
  head "https://github.com/analogdevicesinc/libiio.git"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "libusb"

  def install
    mktemp do
      inreplace buildpath/"CMakeLists.txt",
                "FRAMEWORK DESTINATION ${OSX_INSTALL_FRAMEWORKSDIR}",
                "FRAMEWORK DESTINATION #{prefix}"
      inreplace buildpath/"tests/CMakeLists.txt",
		            "RUNTIME DESTINATION ${OSX_INSTALL_FRAMEWORKSDIR}/iio.framework/Tools",
                "RUNTIME DESTINATION #{prefix}/iio.framework/Tools"

      system "cmake", "-G", "Ninja", buildpath, "-DOSX_PACKAGE=OFF",
             *std_cmake_args
      system "ninja"
      system "cmake", "--build", ".", "--target", "install"
    end
  end

end
