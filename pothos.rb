class Pothos < Formula
  desc "Pothos data-flow software suite"
  homepage "https://github.com/pothosware/pothos/wiki"
  head "https://github.com/pothosware/pothos.git"
  url "https://github.com/pothosware/pothos/archive/pothos-0.4.2.tar.gz"
  sha256 "4d74be56ec9fad82bd189737e031d3f29a441006f96c13e8ff80182b6e626de3"

  depends_on "cmake" => :build
  depends_on "poco"
  depends_on "muparserx"
  depends_on "pothosserialization"

  def install

    args = []

    if !(build.head?)
      args += ["-DPOTHOS_EXTVER=release"]
    end

    args += %W[
      -DPOTHOS_ROOT='#{HOMEBREW_PREFIX}'
      -DENABLE_INTERNAL_POCO=OFF
      -DENABLE_INTERNAL_SPUCE=OFF
      -DENABLE_INTERNAL_MUPARSERX=OFF
      -DENABLE_INTERNAL_SERIALIZATION=OFF
      -DENABLE_TOOLKITS=OFF
    ]

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
