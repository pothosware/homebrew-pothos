class Pothos < Formula
  desc "Pothos data-flow software suite"
  homepage "https://github.com/pothosware/pothos/wiki"
  head "https://github.com/pothosware/pothos.git"
  url "https://github.com/pothosware/pothos/archive/pothos-0.3.1.tar.gz"
  sha256 "17abc96c446615a6f0fd5f265993137185f687b58ac855bb699da564d6d154d9"

  depends_on "cmake" => :build
  depends_on "poco"
  depends_on "muparserx"
  depends_on "pothosserialization"

  #FIXME requires spuce for main library build until 0.3.1
  depends_on "spuce"

  def install
    mkdir "build" do
      args = %W[
        -DPOTHOS_ROOT='#{HOMEBREW_PREFIX}'
        -DENABLE_TOOLKITS=OFF
      ] + std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
