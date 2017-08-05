class Pothospython < Formula
  desc "Pothos language bindings for Python"
  homepage "https://github.com/pothosware/pothos-python/wiki"
  head "https://github.com/pothosware/pothos-python.git"
  url "https://github.com/pothosware/pothos-python/archive/pothos-python-0.3.0.tar.gz"
  sha256 "c3e0b832badbfa011a8c20b574ef16cd08483d0169c1b0959751b3cd1d5e5fb9"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "poco"
  depends_on "nlohmann/json/nlohmann_json"
  depends_on "python" => :recommended
  depends_on "python3" => :optional

  def install

    args = []

    args += ["-DUSE_PYTHON_CONFIG=ON"]

    #using --with-python3 to build bindings for python3
    #its always one or the other, we cant build for both
    if build.with?("python3")
      args += ["-DPython_ADDITIONAL_VERSIONS=3"]
    else
      args += ["-DPython_ADDITIONAL_VERSIONS=2"]
    end

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
