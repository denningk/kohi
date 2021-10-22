#!/bin/bash
# Build script for engine
set echo on

mkdir -p ../bin

# Get a list of all the .c files
cFilenames=$(find . -type f -name "*.c")

echo "Files:" $cFilenames

assembly="engine"
compilerFlags="-g -dynamiclib -fdeclspec -fPIC"
includeFlags="-Iengine/src -I$VULKAN_SDK/include"
linkerFlags="-lvulkan -framework AppKit"
defines="-D_DEBUG -DKEXPORT"

echo "Building $assembly..."
clang $cFilenames $compilerFlags -o ../bin/lib$assembly.dylib $defines $includeFlags $linkerFlags
