class Libmirisdr < Formula
  homepage 'http://cgit.osmocom.org/libmirisdr/'
  head 'git://git.osmocom.org/libmirisdr.git'

  depends_on "pkg-config" => :build
  depends_on 'cmake' => :build
  depends_on 'libusb'

  def install
    mkdir 'build' do
      system "cmake", "..", *std_cmake_args
      system 'make install'
    end
  end
end
