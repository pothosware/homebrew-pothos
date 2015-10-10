class Airspy < Formula
  desc "The usemode driver and associated tools for airspy "
  homepage "http://airspy.com/"
  url "https://github.com/airspy/host/archive/v1.0.6.tar.gz"
  sha256 "58a80db62a178c04f52172e25921f2e1b67f1efaf36e4c808e5b5eeb8f6dbfd9"
  head "https://github.com/airspy/host.git"

  depends_on "cmake" => :build
  depends_on 'libusb'

  def install
    mkdir 'build'
    cd 'build'
    system "cmake", "../", *std_cmake_args
    system "make", "install"
  end

  test do
    # test tools were installed, the other tools proably can't be tested since
    # the user may not have an airspy connected
    system "#{bin}/airspy_lib_version"

    # test libairspy can be included and linked
    (testpath/"testAirspyLib.cpp").write <<-EOS.undent
        #include <libairspy/airspy.h>
        #include <sstream>
        int main(int argc, char *argv[])
        {
            airspy_lib_version_t version;
            airspy_lib_version(&version);

            std::ostringstream versionStream;
            versionStream << version.major_version
                << '.' << version.minor_version
                << '.' << version.revision;

            return !(versionStream.str() == "#{version}");
        }
    EOS
    flags = (ENV.cflags || "").split + (ENV.cppflags || "").split + (ENV.ldflags || "").split
    flags += %W[
      -I#{include}
      -lairspy
    ]
    system ENV.cxx, "testAirspyLib.cpp", "-o", "testAirspyLib", *flags
    system "./testAirspyLib"

  end
end
