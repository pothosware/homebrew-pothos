class Airspyhf < Formula
  desc "AirspyHF+ high performance software defined radio for the HF and VHF bands"
  homepage "https://github.com/airspy/airspyhf"
  head "https://github.com/airspy/airspyhf.git"
  url "https://github.com/airspy/airspyhf/archive/1.0.tar.gz"
  sha256 "7c0105b6ee0000fbad8f86972465e53412e82dc0dd500f4863441b74026bdf35"

  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    args = []

    args += ["-DLIBUSB_INCLUDE_DIR=/usr/local/include/libusb-1.0"]

    mkdir "builddir" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
