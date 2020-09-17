class Pothosplotters < Formula
  desc "Pothos graphical plotter widgets"
  homepage "https://github.com/pothosware/PothosPlotters/wiki"
  head "https://github.com/pothosware/PothosPlotters.git"
  url "https://github.com/pothosware/PothosPlotters/archive/pothos-plotters-0.4.1.tar.gz"
  sha256 "08b890fca7c8678bfb3bc9a77008bbd889f9f942ed8e4765d2e786f0944e8e55"

  depends_on "cmake" => :build
  depends_on "pothos"
  depends_on "pothoscomms"
  depends_on "audiofilter/spuc/spuce"
  depends_on "qt5"
  depends_on "qwt"

  def install
    args = []

    #start path for qwt headers
    args += ["-DQWT_INCLUDE_DIR=/usr/local/lib/qwt.framework/Headers"]

    mkdir "build" do
      args += std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
