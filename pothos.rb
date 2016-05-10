class Pothos < Formula
  desc "Pothos data-flow software suite"
  homepage "https://github.com/pothosware/pothos/wiki"
  head "https://github.com/pothosware/pothos.git"
  url "https://github.com/pothosware/pothos/archive/pothos-0.3.3.tar.gz"
  sha256 "37c575e4dcdedb00827feab7590c55f6e88816e34c1bb0573067d569d9e05a56"

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
