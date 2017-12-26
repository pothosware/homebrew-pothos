class Pothoswidgets < Formula
  desc "Pothos graphical control widgets"
  homepage "https://github.com/pothosware/PothosWidgets/wiki"
  head "https://github.com/pothosware/PothosWidgets.git"
  url "https://github.com/pothosware/PothosWidgets/archive/pothos-widgets-0.5.0.tar.gz"
  sha256 "dd4184b815c8bc66fb440774b63a0d999e5080ef148ada026095ea0f2bc763b1"

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
