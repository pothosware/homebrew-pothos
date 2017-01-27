class Pothoswidgets < Formula
  desc "Pothos graphical control widgets"
  homepage "https://github.com/pothosware/pothos-widgets/wiki"
  head "https://github.com/pothosware/pothos-widgets.git"
  url "https://github.com/pothosware/pothos-widgets/archive/pothos-widgets-0.4.1.tar.gz"
  sha256 "63a020793c9bfa01fdc8bedbcb56dc98113225204ebc623550bde29ce55092b7"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "pothosserialization"
  depends_on "qt5"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
