echo "Downloading nob.h"
curl -s https://raw.githubusercontent.com/tsoding/nob.h/refs/heads/main/nob.h > nob.h
echo "Writing nob.c"
cat <<EOF > nob.c
// Credit : https://github.com/tsoding/nob.h/tree/main

#define NOB_IMPLEMENTATION

#include "nob.h"

#define BUILD_FOLDER "build/"
#define SRC_FOLDER   "src/"

int main(int argc, char **argv)
{
    NOB_GO_REBUILD_URSELF(argc, argv);

    Nob_Cmd cmd = {0};

    if (!nob_mkdir_if_not_exists(BUILD_FOLDER)) return 1;
    nob_cmd_append(&cmd, "cc", "-Wall", "-Wextra", "-o", BUILD_FOLDER"main", SRC_FOLDER"main.c");
    if (!nob_cmd_run_sync(cmd)) return 1;

    return 0;
}
EOF
echo "Creating starter code"
mkdir -p src
cat <<EOF > src/main.c
#include <stdio.h>

int main()
{
    printf("Hello, World!\n");
    return 0;
}
EOF
echo "Creating building script"
cat <<EOF > builder.sh
#!/bin/bash
cc -o nob nob.c
./nob
EOF
chmod +x builder.sh
echo "Cleaning up"
rm -rf nobuild-build-Unix.sh