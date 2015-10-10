require 'formula'

class Bladerf < Formula
  homepage 'http://nuand.com/'
  head 'https://github.com/Nuand/bladeRF.git'

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
