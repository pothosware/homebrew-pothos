class Pothoswidgets < Formula
  desc "Pothos graphical control widgets"
  homepage "https://github.com/pothosware/PothosWidgets/wiki"
  head "https://github.com/pothosware/PothosWidgets.git"
  url "https://github.com/pothosware/PothosWidgets/archive/pothos-widgets-0.4.3.tar.gz"
  sha256 "bdfa42ebf3f757532f810499a70e524e7abf0d5f0f00658a7e23b9898447986c"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "qt5"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
