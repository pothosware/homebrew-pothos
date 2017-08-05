class Pothos < Formula
  desc "Pothos data-flow software suite"
  homepage "https://github.com/pothosware/pothos/wiki"
  head "https://github.com/pothosware/pothos.git"
  url "https://github.com/pothosware/pothos/archive/pothos-0.5.0.tar.gz"
  sha256 "c1dea4228367e4bc46352dca8bf166caca25e411733fe3dc97f94b2c651ebc01"

  depends_on "cmake" => :build
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "muparserx"

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
