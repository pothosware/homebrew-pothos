class Spuce < Formula
  desc "A C++ library for DSP filters"
  homepage "http://pyspuc.com"
  head "https://github.com/audiofilter/spuce.git"
  url "https://github.com/audiofilter/spuce/archive/0.4.3.tar.gz"
  version "0.4.3"
  sha256 "5688e107b57640ba0485790d64eb16bff855f54f6fa5b2fdab568ee91f6dc687"
  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", "-DBUILD_TESTING=OFF", "-DCMAKE_PREFIX_PATH=/usr/local/opt/qt5", *std_cmake_args
      system "make", "install" # if this fails, try separate make/make install steps
    end
  end

  test do
    system "false"
  end
end
