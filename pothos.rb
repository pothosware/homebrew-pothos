class Pothos < Formula
  desc "Pothos data-flow software suite"
  homepage "https://github.com/pothosware/pothos/wiki"
  head "https://github.com/pothosware/pothos.git"
  url "https://github.com/pothosware/pothos/archive/pothos-0.3.2.tar.gz"
  sha256 "8d4aafee0dd23c1d0fa894a6ca30dc220ae141eef8868d646b364648bc1d40c7"

  depends_on "cmake" => :build
  depends_on "poco"
  depends_on "muparserx"
  depends_on "pothosserialization"

  def install
    mkdir "build" do
      args = %W[
        -DPOTHOS_ROOT='#{HOMEBREW_PREFIX}'
        -DENABLE_INTERNAL_POCO=OFF
        -DENABLE_INTERNAL_SPUCE=OFF
        -DENABLE_INTERNAL_MUPARSERX=OFF
        -DENABLE_INTERNAL_SERIALIZATION=OFF
        -DENABLE_TOOLKITS=OFF
      ] + std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
