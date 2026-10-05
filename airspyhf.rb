class Airspyhf < Formula
  desc "AirspyHF+ high performance software defined radio for the HF and VHF bands"
  homepage "https://github.com/airspy/airspyhf"
  head "https://github.com/airspy/airspyhf.git"
  url "https://github.com/airspy/airspyhf/archive/1.6.8.tar.gz"
  sha256 "cd1e5ae89e09b813b096ae4a328e352c9432a582e03fd7da86760ba60efa77ab"

  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    args = []

    args += ["-DCMAKE_POLICY_VERSION_MINIMUM=3.5"]

    mkdir "builddir" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
