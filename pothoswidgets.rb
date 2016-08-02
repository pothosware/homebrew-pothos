class Pothoswidgets < Formula
  desc "Pothos graphical control widgets"
  homepage "https://github.com/pothosware/pothos-widgets/wiki"
  head "https://github.com/pothosware/pothos-widgets.git"
  url "https://github.com/pothosware/pothos-widgets/archive/pothos-widgets-0.4.0.tar.gz"
  sha256 "b9e175a82379fb9794392a783da9882a61f6f68bc57049f11149c2a6041dc526"

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
