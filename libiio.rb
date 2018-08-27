class Libiio < Formula
  desc "Library for interfacing with IIO devices."
  homepage "https://wiki.analog.com/software/linux/docs/iio/iio"
  url "https://github.com/analogdevicesinc/libiio/archive/v0.15.tar.gz"
  sha256 "a729f8ff48137ad271a3e2951f322b35c1bf2ec075b488d75c8bd071c693fd19"
  head "https://github.com/analogdevicesinc/libiio.git"

  depends_on "cmake" => :build
  depends_on "ninja" => :build

  def install
    mktemp do
      inreplace buildpath/"CMakeLists.txt",
                "FRAMEWORK DESTINATION /Library/Frameworks",
                "FRAMEWORK DESTINATION #{prefix}"
      inreplace buildpath/"tests/CMakeLists.txt",
                "RUNTIME DESTINATION /Library/Frameworks/iio.framework/Tools",
                "RUNTIME DESTINATION #{prefix}/iio.framework/Tools"

      system "cmake", "-G", "Ninja", buildpath, "-DOSX_PACKAGE=OFF",
             *std_cmake_args
      system "ninja"
      system "cmake", "--build", ".", "--target", "install"
    end
  end

end
