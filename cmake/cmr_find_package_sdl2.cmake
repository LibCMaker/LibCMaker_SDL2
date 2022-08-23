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

# Part of "LibCMaker/cmake/cmr_find_package.cmake".

  #-----------------------------------------------------------------------
  # Library specific build arguments
  #-----------------------------------------------------------------------

## +++ Common part of the lib_cmaker_<lib_name> function +++
  set(find_LIB_VARS
    COPY_SDL2_CMAKE_BUILD_SCRIPTS

    SDL_FORCE_STATIC_VCRT

    SDL_ATOMIC
    SDL_AUDIO
    SDL_VIDEO
    SDL_RENDER
    SDL_EVENTS
    SDL_JOYSTICK
    SDL_HAPTIC
    SDL_HIDAPI
    SDL_POWER
    SDL_THREADS
    SDL_TIMERS
    SDL_FILE
    SDL_LOADSO
    SDL_CPUINFO
    SDL_FILESYSTEM
    SDL_SENSOR
    SDL_LOCALE
    SDL_MISC

    SDL2_DISABLE_SDL2MAIN
    SDL2_DISABLE_INSTALL
    SDL2_DISABLE_UNINSTALL

    SDL_ASSERTIONS
    SDL_DEPENDENCY_TRACKING
    SDL_LIBC
    SDL_GCC_ATOMICS
    SDL_ASSEMBLY

    SDL_SSEMATH
    SDL_MMX
    SDL_3DNOW
    SDL_SSE
    SDL_SSE2
    SDL_SSE3
    SDL_ALTIVEC
    SDL_ARMSIMD
    SDL_ARMNEON

    SDL_DISKAUDIO
    SDL_DUMMYAUDIO

    SDL_DIRECTFB
    SDL_DIRECTFB_SHARED
    SDL_DUMMYVIDEO

    SDL_OPENGL
    SDL_OPENGLES

    SDL_PTHREADS
    SDL_PTHREADS_SEM

    SDL_OSS
    SDL_ALSA
    SDL_ALSA_SHARED
    SDL_JACK
    SDL_JACK_SHARED
    SDL_ESD
    SDL_ESD_SHARED
    SDL_PIPEWIRE
    SDL_PIPEWIRE_SHARED
    SDL_PULSEAUDIO
    SDL_PULSEAUDIO_SHARED
    SDL_ARTS
    SDL_ARTS_SHARED
    SDL_NAS
    SDL_NAS_SHARED
    SDL_SNDIO
    SDL_SNDIO_SHARED
    SDL_FUSIONSOUND
    SDL_FUSIONSOUND_SHARED
    SDL_LIBSAMPLERATE
    SDL_LIBSAMPLERATE_SHARED

    SDL_RPATH

    SDL_CLOCK_GETTIME

    SDL_X11
    SDL_X11_SHARED

    SDL_X11_XCURSOR
    SDL_X11_XDBE
    SDL_X11_XINPUT
    SDL_X11_XFIXES
    SDL_X11_XRANDR
    SDL_X11_XSCRNSAVER
    SDL_X11_XSHAPE

    SDL_WAYLAND
    SDL_WAYLAND_SHARED
    SDL_WAYLAND_LIBDECOR
    SDL_WAYLAND_LIBDECOR_SHARED
    SDL_WAYLAND_QT_TOUCH
    SDL_RPI
    SDL_COCOA
    SDL_DIRECTX

    SDL_XINPUT
    SDL_WASAPI

    SDL_RENDER_D3D
    SDL_RENDER_METAL
    SDL_VIVANTE
    SDL_VULKAN
    SDL_METAL
    SDL_KMSDRM
    SDL_KMSDRM_SHARED
    SDL_OFFSCREEN

    SDL_BACKGROUNDING_SIGNAL
    SDL_FOREGROUNDING_SIGNAL

    SDL_HIDAPI

    SDL_HIDAPI_LIBUSB
    SDL_HIDAPI_JOYSTICK
    SDL_VIRTUAL_JOYSTICK

    SDL_ASAN

    SDL_SHARED
    SDL_STATIC
    SDL_TEST

    SDL_STATIC_PIC
    SDL_TESTS
    SDL_INSTALL_TESTS

    VIDEO_VITA_PIB
    VIDEO_VITA_PVR
  )

  foreach(d ${find_LIB_VARS})
    if(DEFINED ${d})
      list(APPEND find_CMAKE_ARGS
        -D${d}=${${d}}
      )
    endif()
  endforeach()
## --- Common part of the lib_cmaker_<lib_name> function ---


  #-----------------------------------------------------------------------
  # Building
  #-----------------------------------------------------------------------

## +++ Common part of the lib_cmaker_<lib_name> function +++
  cmr_lib_cmaker_main(
    LibCMaker_DIR ${find_LibCMaker_DIR}
    NAME          ${find_NAME}
    VERSION       ${find_VERSION}
    LANGUAGES     CXX C
    BASE_DIR      ${find_LIB_DIR}
    DOWNLOAD_DIR  ${cmr_DOWNLOAD_DIR}
    UNPACKED_DIR  ${cmr_UNPACKED_DIR}
    BUILD_DIR     ${lib_BUILD_DIR}
    CMAKE_ARGS    ${find_CMAKE_ARGS}
    INSTALL
  )
## --- Common part of the lib_cmaker_<lib_name> function ---
