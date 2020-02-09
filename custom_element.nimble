# Package

version       = "0.1.0"
author        = "zacharycarter"
description   = "W3C Custom Elements for Nim"
license       = "MIT"
srcDir        = "src"
bin           = @["custom_elements.js"]
binDir        = "bin"
installExt    = @["nim"]
backend       = "js"

# Dependencies

requires "nim >= 0.18.1"
requires "ast_pattern_matching >= 1.0.0"
requires "https://github.com/zacharycarter/litz.git"

task test, "run custom_elements tests":
  withDir "tests":
    exec "nim js test_custom_elements.nim"
    exec "node runner.js"

task dtest, "run custom_elements tests w/ nes debug flag on":
  withDir "tests":
    exec "nim js -d:debugNES test_custom_elements.nim"
    exec "node runner.js"
  
task mtools, "run macro tools":
  withDir "tools":
    exec "nim c -r mtools.nim"