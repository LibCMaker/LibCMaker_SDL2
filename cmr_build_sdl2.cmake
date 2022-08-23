# ****************************************************************************
#  Project:  LibCMaker
#  Purpose:  A CMake build scripts for build libraries with CMake
#  Author:   NikitaFeodonit, nfeodonit@yandex.com
# ****************************************************************************
#    Copyright (c) 2017-2022 NikitaFeodonit
#
#    This file is part of the LibCMaker project.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published
#    by the Free Software Foundation, either version 3 of the License,
#    or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program. If not, see <http://www.gnu.org/licenses/>.
# ****************************************************************************

#-----------------------------------------------------------------------
# The file is an example of the convenient script for the library build.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Lib's name, version, paths
#-----------------------------------------------------------------------

set(SDL2_lib_NAME "SDL2")
set(SDL2_lib_VERSION "2.24.0" CACHE STRING "SDL2_lib_VERSION")
set(SDL2_lib_DIR "${CMAKE_CURRENT_LIST_DIR}" CACHE PATH "SDL2_lib_DIR")


# To use our Find<LibName>.cmake.
list(APPEND CMAKE_MODULE_PATH "${SDL2_lib_DIR}/cmake/modules")


#-----------------------------------------------------------------------
# LibCMaker_<LibName> specific vars and options
#-----------------------------------------------------------------------

option(COPY_SDL2_CMAKE_BUILD_SCRIPTS "COPY_SDL2_CMAKE_BUILD_SCRIPTS" OFF)


include(CMakeDependentOption)

macro(SET_OPTION _NAME _DESC)
  if(${ARGC} EQUAL 3)
    set(_DEFLT ${ARGV2})
  else()
    set(_DEFLT OFF)
  endif()
  option(${_NAME} ${_DESC} ${_DEFLT})
endmacro()

macro(DEP_OPTION _NAME _DESC _DEFLT _DEPTEST _FAILDFLT)
  cmake_dependent_option("${_NAME}" "${_DESC}" "${_DEFLT}" "${_DEPTEST}" "${_FAILDFLT}")
endmacro()

macro(OPTION_STRING _NAME _DESC _VALUE)
  set(${_NAME} ${_VALUE} CACHE STRING "${_DESC}")
ENDMACRO()


if(MSVC)
  option(SDL_FORCE_STATIC_VCRT "Force /MT for static VC runtimes" OFF)
endif()

# NOTE: These are required: Threads, Loadso.
#option(SDL_ATOMIC       "Enable the Atomic subsystem"       OFF)
#option(SDL_AUDIO        "Enable the Audio subsystem"        OFF)
#option(SDL_VIDEO        "Enable the Video subsystem"        ON)
#option(SDL_RENDER       "Enable the Render subsystem"       ON)
#option(SDL_EVENTS       "Enable the Events subsystem"       ON)
#option(SDL_JOYSTICK     "Enable the Joystick subsystem"     OFF)
#option(SDL_HAPTIC       "Enable the Haptic subsystem"       OFF)
#option(SDL_HIDAPI       "Enable the Hidapi subsystem"       OFF)
#option(SDL_POWER        "Enable the Power subsystem"        OFF)
#option(SDL_THREADS      "Enable the Threads subsystem"      ON)
#option(SDL_TIMERS       "Enable the Timers subsystem"       OFF)
#option(SDL_FILE         "Enable the File subsystem"         OFF)
#option(SDL_LOADSO       "Enable the Loadso subsystem"       ON)
#option(SDL_CPUINFO      "Enable the CPUinfo subsystem"      OFF)
#option(SDL_FILESYSTEM   "Enable the Filesystem subsystem"   OFF)
#option(SDL_SENSOR       "Enable the Sensor subsystem"       OFF)
#option(SDL_LOCALE       "Enable the Locale subsystem"       ON)
#option(SDL_MISC         "Enable the Misc subsystem"         ON)

option(SDL_ATOMIC       "Enable the Atomic subsystem"       ON)
option(SDL_AUDIO        "Enable the Audio subsystem"        ON)
option(SDL_VIDEO        "Enable the Video subsystem"        ON)
option(SDL_RENDER       "Enable the Render subsystem"       ON)
option(SDL_EVENTS       "Enable the Events subsystem"       ON)
option(SDL_JOYSTICK     "Enable the Joystick subsystem"     ON)
option(SDL_HAPTIC       "Enable the Haptic subsystem"       ON)
option(SDL_HIDAPI       "Enable the Hidapi subsystem"       ON)
option(SDL_POWER        "Enable the Power subsystem"        ON)
option(SDL_THREADS      "Enable the Threads subsystem"      ON)
option(SDL_TIMERS       "Enable the Timers subsystem"       ON)
option(SDL_FILE         "Enable the File subsystem"         ON)
option(SDL_LOADSO       "Enable the Loadso subsystem"       ON)
option(SDL_CPUINFO      "Enable the CPUinfo subsystem"      ON)
option(SDL_FILESYSTEM   "Enable the Filesystem subsystem"   ON)
option(SDL_SENSOR       "Enable the Sensor subsystem"       ON)
option(SDL_LOCALE       "Enable the Locale subsystem"       ON)
option(SDL_MISC         "Enable the Misc subsystem"         ON)


# Allow some projects to be built conditionally.
set_option(SDL2_DISABLE_SDL2MAIN   "Disable building/installation of SDL2main" OFF)
set_option(SDL2_DISABLE_INSTALL    "Disable installation of SDL2" OFF)
set_option(SDL2_DISABLE_UNINSTALL  "Disable uninstallation of SDL2" ON)

#option_string(SDL_ASSERTIONS "Enable internal sanity checks (auto/disabled/release/enabled/paranoid)" "auto")
##set_option(SDL_DEPENDENCY_TRACKING "Use gcc -MMD -MT dependency tracking" ON)
#set_option(SDL_LIBC                "Use the system C library" ${OPT_DEF_LIBC})
#set_option(SDL_GCC_ATOMICS         "Use gcc builtin atomics" ${OPT_DEF_GCC_ATOMICS})
#set_option(SDL_ASSEMBLY            "Enable assembly routines" ${OPT_DEF_ASM})

#set_option(SDL_SSEMATH             "Allow GCC to use SSE floating point math" ${OPT_DEF_SSEMATH})
#set_option(SDL_MMX                 "Use MMX assembly routines" ${OPT_DEF_ASM})
#set_option(SDL_3DNOW               "Use 3Dnow! MMX assembly routines" ${OPT_DEF_ASM})
#set_option(SDL_SSE                 "Use SSE assembly routines" ${OPT_DEF_ASM})
#set_option(SDL_SSE2                "Use SSE2 assembly routines" ${OPT_DEF_SSEMATH})
#set_option(SDL_SSE3                "Use SSE3 assembly routines" ${OPT_DEF_SSEMATH})
#set_option(SDL_ALTIVEC             "Use Altivec assembly routines" ${OPT_DEF_ASM})
#set_option(SDL_ARMSIMD             "use SIMD assembly blitters on ARM" OFF)
#set_option(SDL_ARMNEON             "use NEON assembly blitters on ARM" OFF)

#set_option(SDL_DISKAUDIO           "Support the disk writer audio driver" ON)
#set_option(SDL_DUMMYAUDIO          "Support the dummy audio driver" ON)

#set_option(SDL_DIRECTFB            "Use DirectFB video driver" OFF)
#dep_option(SDL_DIRECTFB_SHARED     "Dynamically load directfb support" ON "SDL_DIRECTFB" OFF)
#set_option(SDL_DUMMYVIDEO          "Use dummy video driver" ON)

#set_option(SDL_OPENGL              "Include OpenGL support" ON)
#set_option(SDL_OPENGLES            "Include OpenGL ES support" ON)

#set_option(SDL_PTHREADS            "Use POSIX threads for multi-threading" ${SDL_PTHREADS_ENABLED_BY_DEFAULT})
#dep_option(SDL_PTHREADS_SEM        "Use pthread semaphores" ON "SDL_PTHREADS" OFF)

#dep_option(SDL_OSS                 "Support the OSS audio API" ON "UNIX_SYS OR RISCOS" OFF)
#set_option(SDL_ALSA                "Support the ALSA audio API" ${UNIX_SYS})
#dep_option(SDL_ALSA_SHARED         "Dynamically load ALSA audio support" ON "SDL_ALSA" OFF)
#set_option(SDL_JACK                "Support the JACK audio API" ${UNIX_SYS})
#dep_option(SDL_JACK_SHARED         "Dynamically load JACK audio support" ON "SDL_JACK" OFF)
#set_option(SDL_ESD                 "Support the Enlightened Sound Daemon" ${UNIX_SYS})
#dep_option(SDL_ESD_SHARED          "Dynamically load ESD audio support" ON "SDL_ESD" OFF)
#set_option(SDL_PIPEWIRE            "Use Pipewire audio" ${UNIX_SYS})
#dep_option(SDL_PIPEWIRE_SHARED     "Dynamically load Pipewire support" ON "SDL_PIPEWIRE" OFF)
#set_option(SDL_PULSEAUDIO          "Use PulseAudio" ${UNIX_SYS})
#dep_option(SDL_PULSEAUDIO_SHARED   "Dynamically load PulseAudio support" ON "SDL_PULSEAUDIO" OFF)
#set_option(SDL_ARTS                "Support the Analog Real Time Synthesizer" ${UNIX_SYS})
#dep_option(SDL_ARTS_SHARED         "Dynamically load aRts audio support" ON "SDL_ARTS" OFF)
#set_option(SDL_NAS                 "Support the NAS audio API" ${UNIX_SYS})
#dep_option(SDL_NAS_SHARED          "Dynamically load NAS audio support" ON "SDL_NAS" OFF)
#set_option(SDL_SNDIO               "Support the sndio audio API" ${UNIX_SYS})
#dep_option(SDL_SNDIO_SHARED        "Dynamically load the sndio audio API" ON "SDL_SNDIO" OFF)
#set_option(SDL_FUSIONSOUND         "Use FusionSound audio driver" OFF)
#dep_option(SDL_FUSIONSOUND_SHARED  "Dynamically load fusionsound audio support" ON "SDL_FUSIONSOUND" OFF)
#set_option(SDL_LIBSAMPLERATE       "Use libsamplerate for audio rate conversion" ${UNIX_SYS})
#dep_option(SDL_LIBSAMPLERATE_SHARED "Dynamically load libsamplerate" ON "SDL_LIBSAMPLERATE" OFF)

#set_option(SDL_RPATH               "Use an rpath when linking SDL" ${UNIX_SYS})

#set_option(SDL_CLOCK_GETTIME       "Use clock_gettime() instead of gettimeofday()" ${SDL_CLOCK_GETTIME_ENABLED_BY_DEFAULT})

#set_option(SDL_X11                 "Use X11 video driver" ${UNIX_SYS})
#dep_option(SDL_X11_SHARED          "Dynamically load X11 support" ON "SDL_X11" OFF)

#dep_option(SDL_X11_XCURSOR         "Enable Xcursor support"     ON "SDL_X11" OFF)
#dep_option(SDL_X11_XDBE            "Enable Xdbe support"        ON "SDL_X11" OFF)
#dep_option(SDL_X11_XINPUT          "Enable XInput support"      ON "SDL_X11" OFF)
#dep_option(SDL_X11_XFIXES          "Enable Xfixes support"      ON "SDL_X11" OFF)
#dep_option(SDL_X11_XRANDR          "Enable Xrandr support"      ON "SDL_X11" OFF)
#dep_option(SDL_X11_XSCRNSAVER      "Enable Xscrnsaver support"  ON "SDL_X11" OFF)
#dep_option(SDL_X11_XSHAPE          "Enable XShape support"      ON "SDL_X11" OFF)

#set_option(SDL_WAYLAND             "Use Wayland video driver" ${UNIX_SYS})
#dep_option(SDL_WAYLAND_SHARED      "Dynamically load Wayland support" ON "SDL_WAYLAND" OFF)
#dep_option(SDL_WAYLAND_LIBDECOR    "Use client-side window decorations on Wayland" ON "SDL_WAYLAND" OFF)
#dep_option(SDL_WAYLAND_LIBDECOR_SHARED     "Dynamically load libdecor support" ON "SDL_WAYLAND_LIBDECOR" OFF)
#dep_option(SDL_WAYLAND_QT_TOUCH    "QtWayland server support for Wayland video driver" ON "SDL_WAYLAND" OFF)
#set_option(SDL_RPI                 "Use Raspberry Pi video driver" ${UNIX_SYS})
#set_option(SDL_COCOA               "Use Cocoa video driver" ${APPLE})
#set_option(SDL_DIRECTX             "Use DirectX for Windows audio/video" ${WINDOWS})

#set_option(SDL_XINPUT              "Use Xinput for Windows" ${WINDOWS})
#set_option(SDL_WASAPI              "Use the Windows WASAPI audio driver" ${WINDOWS})

#set_option(SDL_RENDER_D3D          "Enable the Direct3D render driver" ${WINDOWS})
#set_option(SDL_RENDER_METAL        "Enable the Metal render driver" ${APPLE})
#set_option(SDL_VIVANTE             "Use Vivante EGL video driver" ${UNIX_SYS})
#dep_option(SDL_VULKAN              "Enable Vulkan support" ON "ANDROID OR APPLE OR LINUX OR WINDOWS" OFF)
#set_option(SDL_METAL               "Enable Metal support" ${APPLE})
#set_option(SDL_KMSDRM              "Use KMS DRM video driver" ${UNIX_SYS})
#dep_option(SDL_KMSDRM_SHARED       "Dynamically load KMS DRM support" ON "SDL_KMSDRM" OFF)
#set_option(SDL_OFFSCREEN           "Use offscreen video driver" OFF)

#option_string(SDL_BACKGROUNDING_SIGNAL "number to use for magic backgrounding signal or 'OFF'" OFF)
#option_string(SDL_FOREGROUNDING_SIGNAL "number to use for magic foregrounding signal or 'OFF'" OFF)

#set_option(SDL_HIDAPI              "Enable the HIDAPI subsystem" ON)

#dep_option(SDL_HIDAPI_LIBUSB       "Use libusb for low level joystick drivers" OFF SDL_HIDAPI OFF)
#dep_option(SDL_HIDAPI_JOYSTICK     "Use HIDAPI for low level joystick drivers" ON SDL_HIDAPI OFF)
#dep_option(SDL_VIRTUAL_JOYSTICK    "Enable the virtual-joystick driver" ON SDL_HIDAPI OFF)

#set_option(SDL_ASAN                "Use AddressSanitizer to detect memory errors" OFF)

if(BUILD_SHARED_LIBS)
  set(SDL_SHARED_ENABLED_BY_DEFAULT ON)
  set(SDL_STATIC_ENABLED_BY_DEFAULT OFF)
else()
  set(SDL_SHARED_ENABLED_BY_DEFAULT OFF)
  set(SDL_STATIC_ENABLED_BY_DEFAULT ON)
endif()

set(SDL_SHARED ${SDL_SHARED_ENABLED_BY_DEFAULT} CACHE BOOL "Build a shared version of the library")
set(SDL_STATIC ${SDL_STATIC_ENABLED_BY_DEFAULT} CACHE BOOL "Build a static version of the library")
set(SDL_TEST   OFF CACHE BOOL "Build the SDL2_test library")

#dep_option(SDL_STATIC_PIC      "Static version of the library should be built with Position Independent Code" "${CMAKE_POSITION_INDEPENDENT_CODE}" "SDL_STATIC" OFF)
#dep_option(SDL_TESTS           "Build the test directory" OFF SDL_TEST OFF)
#set_option(SDL_INSTALL_TESTS   "Install test-cases" OFF)

#if(VITA)
#  set_option(VIDEO_VITA_PIB  "Build with PSVita piglet gles2 support" OFF)
#  set_option(VIDEO_VITA_PVR  "Build with PSVita PVR gles/gles2 support" OFF)
#endif()


#-----------------------------------------------------------------------
# Library specific vars and options
#-----------------------------------------------------------------------



#-----------------------------------------------------------------------
# Build, install and find the library
#-----------------------------------------------------------------------

cmr_find_package(
  LibCMaker_DIR   ${LibCMaker_DIR}
  NAME            ${SDL2_lib_NAME}
  VERSION         ${SDL2_lib_VERSION}
  LIB_DIR         ${SDL2_lib_DIR}
  REQUIRED
  CONFIG
)
