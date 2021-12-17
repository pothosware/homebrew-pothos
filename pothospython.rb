class Pothospython < Formula
  desc "Pothos language bindings for Python"
  homepage "https://github.com/pothosware/PothosPython/wiki"
  head "https://github.com/pothosware/PothosPython.git"
  url "https://github.com/pothosware/PothosPython/archive/pothos-python-0.4.3.tar.gz"
  sha256 "6086a9988ac86cc1ca96e2082aff426311ad941ad6a7d4d73eef07f9258920ad"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "python" => :recommended

  def install

    args = []

    args += ["-DUSE_PYTHON_CONFIG=ON"]
    args += ["-DPython_ADDITIONAL_VERSIONS=3"]

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
