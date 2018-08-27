class Libad9361 < Formula
  desc "IIO AD9361 library for filter design and handling, multi-chip sync, etc."
  homepage "https://wiki.analog.com/software/linux/docs/iio/iio"
  url "https://github.com/analogdevicesinc/libad9361-iio/archive/v0.1.tar.gz"
  sha256 "46eeacb696e3b70873c541761af189a8ecde6ab7b3e7a5273dfc003e3ba0165d"
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
                 "FRAMEWORK DESTINATION lib",
                 "FRAMEWORK DESTINATION ."

      system "cmake", "-G", "Ninja", buildpath, "-DOSX_PACKAGE=OFF",
             "-DCMAKE_FRAMEWORK_PATH=#{libiio.opt_prefix}",
             *std_cmake_args
      system "ninja"
      system "cmake", "--build", ".", "--target", "install"
    end
  end

end
