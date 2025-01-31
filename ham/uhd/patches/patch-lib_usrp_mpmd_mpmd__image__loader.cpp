$NetBSD: patch-lib_usrp_mpmd_mpmd__image__loader.cpp,v 1.1 2024/04/25 12:22:39 tnn Exp $

Fix boost fallout
https://github.com/EttusResearch/uhd/commit/ea586168c596d13d05d145832519755794649ba0
https://github.com/EttusResearch/uhd/commit/c4863b9b9f8b639260f7797157e8ac4dd81f

--- lib/usrp/mpmd/mpmd_image_loader.cpp.orig	2023-11-13 15:22:00.000000000 +0000
+++ lib/usrp/mpmd/mpmd_image_loader.cpp
@@ -21,14 +21,11 @@
 #include <boost/algorithm/string.hpp>
 #include <boost/archive/iterators/binary_from_base64.hpp>
 #include <boost/archive/iterators/transform_width.hpp>
-#include <boost/filesystem/convenience.hpp>
 #include <boost/optional.hpp>
 #include <boost/property_tree/xml_parser.hpp>
 #include <cctype>
 #include <fstream>
 #include <iterator>
-#include <sstream>
-#include <streambuf>
 #include <string>
 #include <vector>
 
@@ -271,7 +268,7 @@ static uhd::usrp::component_files_t bin_
     // DTS component struct
     // First, we need to determine the name
     const std::string base_name =
-        boost::filesystem::change_extension(fpga_path, "").string();
+        boost::filesystem::path(fpga_path).replace_extension("").string();
     if (base_name == fpga_path) {
         const std::string err_msg(
             "Can't cut extension from FPGA filename... " + fpga_path);
@@ -340,7 +337,7 @@ static void mpmd_send_fpga_to_device(
         UHD_LOG_TRACE("MPMD IMAGE LOADER", "FPGA path: " << fpga_path);
 
         // If the fpga_path is a lvbitx file, parse it as such
-        if (boost::filesystem::extension(fpga_path) == ".lvbitx") {
+        if (boost::filesystem::path(fpga_path).extension() == ".lvbitx") {
             all_component_files = lvbitx_to_component_files(fpga_path, delay_reload);
         } else {
             all_component_files = bin_dts_to_component_files(fpga_path, delay_reload);
