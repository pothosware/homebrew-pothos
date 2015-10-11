class Bladerf < Formula
  homepage 'http://nuand.com/'
  head 'https://github.com/Nuand/bladeRF.git'
  url "https://github.com/Nuand/bladeRF/archive/2015.07.tar.gz"
  sha256 "9e15911ab39ba1eb4aa1bcbf518a0eac5396207fc4a58c32b2550fe0a65f9d22"

  depends_on "pkg-config" => :build
  depends_on 'cmake' => :build
  depends_on 'libusb'

  def install
    cd 'host'
    mkdir 'build' do
      system 'cmake', '..', *std_cmake_args << "-DINSTALL_UDEV_RULES=OFF"
      system 'make'
      system 'make install'
    end
  end
end
