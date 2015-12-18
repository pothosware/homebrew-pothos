class Pothos < Formula
  desc "Pothos data-flow software suite"
  homepage "https://github.com/pothosware/pothos/wiki"
  head "https://github.com/pothosware/pothos.git"

  depends_on "cmake" => :build
  depends_on "poco"
  depends_on "muparserx"
  depends_on "pothosserialization"

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
