class Pothos < Formula
  desc "Pothos data-flow software suite"
  homepage "https://github.com/pothosware/PothosCore/wiki"
  head "https://github.com/pothosware/PothosCore.git"
  url "https://github.com/pothosware/PothosCore/archive/pothos-0.7.0.tar.gz"
  sha256 "b182f105a7986a376131e00e7f5a77661d26fce9db1c2686f4fe4e4c7be05f1d"

  depends_on "cmake" => :build
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "pothosware/pothos/muparserx"

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
