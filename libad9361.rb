class Libad9361 < Formula
  desc "IIO AD9361 library for filter design and handling, multi-chip sync, etc."
  homepage "https://wiki.analog.com/software/linux/docs/iio/iio"
  url "https://github.com/analogdevicesinc/libad9361-iio/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "f4976a1317a0b7cf84727d068be5a52c070539ca7301f0160b0677a429538d87"
  head "https://github.com/analogdevicesinc/libad9361-iio.git"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "libiio"

  def install
    libiio = Formulary.factory 'libiio'

    mktemp do
      if !(build.head?)
        inreplace  buildpath/"CMakeLists.txt",
                   "include(FindGit OPTIONAL)",
                   "SET(FindGit)"
      end
      inreplace  buildpath/"CMakeLists.txt",
                 "FRAMEWORK DESTINATION ${OSX_INSTALL_FRAMEWORKSDIR}",
                 "FRAMEWORK DESTINATION ."

      system "cmake", "-G", "Ninja", buildpath, "-DOSX_PACKAGE=OFF",
             "-DCMAKE_FRAMEWORK_PATH=#{libiio.opt_prefix}",
             *std_cmake_args
      system "ninja"
      system "cmake", "--build", ".", "--target", "install"
    end
  end

end
