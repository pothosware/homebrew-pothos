class Pothosserialization < Formula
  desc "Pothos serialization support software"
  homepage "https://github.com/pothosware/pothos-serialization/blob/master/README.md"
  head "https://github.com/pothosware-serialization/pothos.git"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
