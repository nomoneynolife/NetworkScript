# KMS 激活服务器

用法；http

vlmcs是用于检测KMS服务器
vlmcsd是用于搭建KMS服务器
vlmcsdmulti是上面两者的综合


[源代码](https://forums.mydigitallife.net/threads/emulated-kms-servers-on-non-windows-platforms.50234/ "源码")

- 更新最新版；2020-3-29

- CHANGES
0. 2020-03-28 (1113)
1. .kmd file format changed to version 2.0 (version 1.x files cannot be used any more)
2. host builds are now configurable in the .kmd file
3. Bugfix: vlmcs did not use the configured CSVLKs when used with -G
4. Bugfix: .kmd file version was not displayed correctly on big-endian systems
5. Bugfix: Posix versions of vlmcsd were unable to read MS-DOS/Windows text files with crlf line termination
6. Bugfix: the NO_INI_FILE CFLAG did not work in combination with some other directives
7. New CFLAG NO_COMPILER_UAA disables all compiler/platform support for big-endian/little-endian conversion. Required on some toolchains that are incorrectly configured
8. The bootable floppy directory now contains a .vmx file that can be used to directly start the floppy in VMware products, e.g. the free VMware player
9. When you use -v all CSVLK available in the .kmd file are now logged at program startup.
10. If you do not use -N0 or -N1 to force disable/enable the NDR64 protocol, vlmcsd now uses the host build to decide if it uses NDR64 depending if a genuine KMS is using NDR64 on that build.

0. 2018-10-15 (1112)
1. Support for Windows 10 1809, Windows Server 2019 and Office 2019 built-in
2. vlmcsd now has fully configurable CSVLKs that allow a custom EPID and HwId for each CSVLK to be specified.
3. Options -w, -0, -3, -6 and -G have been removed in favor for the new -a option.
4. The -H option has been redefined: It now allows a fixed host build to be specified in random EPIDs
5. New INI file directive HostBuild= that does the same as the new -H option.
6. Bugfix: day of year in EPID is now from 1 to 366 instead of 0 to 365.

0. 2017-06-17 (1111)
1. Support for Windows Professional Workstation and Windows Professional Workstation N (aka Win 10 Pro for Advanced PCs)
2.  Updated vlmcsd.kmd
3.  Updated internal databases of vlmcs and vlmcsdmulti
4.  Some internal code optimizations

0. 2017-05-31 (1110)
1. Updated Visual C++ Platform Toolset to v141_xp
2. Updated gcc to 6.3.0 on many platforms
3. Removed 32-bit cygwin OpenSSL binary because 64-bit Cygwin no longer features 32-bit OpenSSL headers and libraries
4. Changed Windows build script to use MSBuild 2017
5. Updated groff formatting options for ASCII (TXT) man files
6. Added support for Enterprise G and Enterprise GN (Windows China Government Edition)
7. New command line switch -G <EPID> to specify an EPID for Windows China Government versions
8. New INI file directive WinChinaGov (same as command line -G)
9. Added a warning if a legacy database is detected
10. Bootable floppy: New SYSLINUX.CFG parameter WINCHINAGOV= to set the EPID for Windows China Government Editions (Enterprise G/GN)
11. Added suffix _unused to some local parameters to indicate that MSVC compiler warnings can be ignored
12. Renamed some local parameters to avoid compiler warnings
13. Added casts to reduce MSVC compiler warnings
14. Fixed a bug in memory allocation, if .kmd file has less CSVLKs than built-in minimum


