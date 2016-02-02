class Soapysdr < Formula
  desc "Vendor and platform neutral SDR support library"
  homepage "https://github.com/pothosware/SoapySDR/wiki"
  head "https://github.com/pothosware/SoapySDR.git"
  url "https://github.com/pothosware/SoapySDR/archive/soapy-sdr-0.4.1.tar.gz"
  sha256 "134471fbcf2e29d679c6d1ef0b14e6337d37636d9a9460a05beff96945038340"

  depends_on "cmake" => :build
  depends_on "swig" => :build

  patch :DATA

  def install
    mkdir "build" do
      args = %W[
        -DSOAPY_SDR_ROOT='#{HOMEBREW_PREFIX}'
      ] + std_cmake_args
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end

__END__
diff --git a/cmake/SoapySDRUtil.cmake b/cmake/SoapySDRUtil.cmake
index ccd8886..2be35cc 100644
--- a/cmake/SoapySDRUtil.cmake
+++ b/cmake/SoapySDRUtil.cmake
@@ -44,7 +44,7 @@ function(SOAPY_SDR_MODULE_UTIL)
 
     install(
         TARGETS ${MODULE_TARGET}
-        DESTINATION ${MODULE_PREFIX}/lib${LIB_SUFFIX}/SoapySDR/modules/
+        DESTINATION lib${LIB_SUFFIX}/SoapySDR/modules/
     )
 
 endfunction(SOAPY_SDR_MODULE_UTIL)
