# [Compiler.nvim](https://github.com/Zeioth/compiler.nvim)
Neovim compiler for building and running your code without having to configure anything.

![screenshot_2023-06-19_13-59-07_947251291](https://github.com/Zeioth/compiler.nvim/assets/3357792/7c31d02c-2e8d-4562-bcec-323d8a468f67)

<div align="center">
  <a href="https://discord.gg/ymcMaSnq7d" rel="nofollow">
      <img src="https://img.shields.io/discord/1121138836525813760?color=azure&labelColor=6DC2A4&logo=discord&logoColor=black&label=Join the discord server&style=for-the-badge" data-canonical-src="https://img.shields.io/discord/1121138836525813760">
    </a>
</div>

## Table of contents

- [Why](#why)
- [Supported languages](#supported-languages)
- [Required system dependencies](#required-system-dependencies)
- [How to install](#how-to-install)
- [Commands](#commands)
- [Basic usage](#how-to-use-basic-usage)
- [Creating a solution (optional)](#creating-a-solution-optional)
- [Build automation utilities (optional)](#build-automation-utilities-optional)
- [Quick start](#quick-start)
- [FAQ](#faq)

## Why
Those familiar with Visual Studio IDE will remember how convenient it was to just press a button and having your program compiled and running. I wanted to bring that same user experience to Neovim.

## Supported languages

| Language | More info |
|--|--|
| [asm x86-64](https://github.com/Zeioth/compiler.nvim/blob/main/lua/compiler/languages/asm.lua)| | 
| [c](https://github.com/Zeioth/compiler.nvim/blob/main/lua/compiler/languages/c.lua) ||
| [c++](https://github.com/Zeioth/compiler.nvim/blob/main/lua/compiler/languages/cpp.lua) ||
|[c#](https://github.com/Zeioth/compiler.nvim/blob/main/lua/compiler/languages/cs.lua)  | [+info](https://github.com/Zeioth/compiler.nvim/wiki/cs-compiler) |
| [dart](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/dart.lua) | [+info](https://github.com/Zeioth/compiler.nvim/wiki/dart-compiler) |
| [elixir](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/elixir.lua) | [+info](https://github.com/Zeioth/compiler.nvim/wiki/elixir-compiler) |
| [f#](https://github.com/Zeioth/compiler.nvim/blob/main/lua/compiler/languages/fsharp.lua) |[+info](https://github.com/Zeioth/compiler.nvim/wiki/fsharp-compiler) |
| [flutter](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/dart.lua) | [+info](https://github.com/Zeioth/compiler.nvim/wiki/dart-compiler) |
| [go](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/go.lua) ||
| [java](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/java.lua) | [+info](https://github.com/Zeioth/compiler.nvim/wiki/java-compiler) |
| [javascript](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/javascript.lua) | [+info](https://github.com/Zeioth/compiler.nvim/wiki/javascript-interpreter) |
| [kotlin](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/kotlin.lua)  | [+info](https://github.com/Zeioth/compiler.nvim/wiki/java-compiler) |
| [lua](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/lua.lua) ||
| [make](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/make.lua) ||
| [perl](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/perl.lua) ||
| [python](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/python.lua)  | [+info](https://github.com/Zeioth/compiler.nvim/wiki/python-compiler) |
| [r](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/r.lua) ||
| [ruby](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/ruby.lua) ||
| [rust](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/rust.lua) ||
| [shell](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/shell.lua) | [+info](https://github.com/Zeioth/compiler.nvim/wiki/shell-interpreter) |
| [typescript](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/typescript.lua) | [+info](https://github.com/Zeioth/compiler.nvim/wiki/typescript-transpiler) |
| [visual basic dotnet](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/vb.lua) | [+info](https://github.com/Zeioth/compiler.nvim/wiki/visual-basic-dotnet-compiler) |
| [zig](https://github.com/Zeioth/Compiler.nvim/blob/main/lua/compiler/languages/zig.lua) | [+info](https://github.com/Zeioth/compiler.nvim/wiki/zig-compiler) |
  
## Required system dependencies
Some languages require you manually install their compilers in your machine, so compiler.nvim is able to call them. [Please check here](https://github.com/Zeioth/Compiler.nvim/wiki/how-to-install-the-required-dependencies), as the packages will be different depending your operative system.

## How to install
lazy.nvim package manager
```lua
{ -- This plugin
  "Zeioth/compiler.nvim",
  cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
  dependencies = {
    {
      -- The task runner we use
      "stevearc/overseer.nvim",
      commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
      opts = {
        task_list = {
          direction = "bottom",
          min_height = 25,
          max_height = 25,
          default_detail = 1,
        },
      },
    },
  },
  opts = {},
},
```

### Recommended mappings

```lua
-- Open compiler
vim.api.nvim_set_keymap('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap('n', '<S-F6>',
     "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<S-F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
```

## Commands

| Command | Description|
|--|--|
| `:CompilerOpen` | Shows the adecuated compiler for your buffer's filetype. |
| `:CompilerToggleResults` | Open or close the compiler results. |
| `:CompilerRedo` | Redo the last selected option. |
| `:CompilerStop` | Dispose all tasks. |


## How to use (Basic usage)
This is what happen when you select `build & run`, `build`, or `run` in the compiler:

> compiler.nvim will look for the conventional entry point file for the current language you are using. To achieve this, it searches in your current working directory for the next files

| Language | Default entry point | Default output |
|--|--|--|
| asm x86-64 | ./main.asm | ./bin/program |
| c | ./main.c | ./bin/program |
| c++ | ./main.cpp | ./bin/program |
| c# | ./Program.cs | ./bin/Program.exe |
| dart | ./lib/main.dart | ./bin/main |
| elixir | ./mix.exs | ./_build/ |
| f# | [see here](https://github.com/Zeioth/compiler.nvim/wiki/fsharp-compiler) | ./bin/ |
| flutter | ./pubspec.yaml | ./build/ |
| go | ./main.go | ./bin/program |
| java | ./Main.java | ./bin/Main.class |
| javascript | ./src/index.js |  |
| kotlin | ./Main.kt | ./bin/MainKt.class |
| lua | ./main.lua |  |
| make | ./Makefile | |
| perl | ./main.pl |  |
| python | ./main.py | ./bin/program |
| r | ./main.r |  |
| ruby | ./main.rb |  |
| rust | ./main.rs | ./bin/program |
| shell | ./main.sh |  |
| typescript | ./src/index.ts |  |
| visual basic .net | [see here](https://github.com/Zeioth/compiler.nvim/wiki/visual-basic-dotnet-compiler) | ./bin/ |
| zig | ./build.zig | ./zig-out/bin/build |

This is how the compilation results look after selecting `Build & run program` in c
![screenshot_2023-06-19_13-59-37_766847673](https://github.com/Zeioth/compiler.nvim/assets/3357792/42c4ec0d-4446-4ac6-9c4a-478a32d23ca7)
[For more info see wiki - when to use every option](https://github.com/Zeioth/compiler.nvim/wiki/When-to-use-every-option)

## Creating a solution (optional)
If you want to have more control, you can create a `.solution.toml` file in your working directory by using this template where every [entry] represents a program to compile

```toml
[HelloWorld]
entry_point = "/path/to/my/entry_point_file/main.c"
output = "/path/where/the/program/will/be/written/hello_world"
arguments = ""

[SOLUTION]
executable = "/program/to/execute/after/the/solution/has/compiled/my_program"
```

[For more examples see wiki](https://github.com/Zeioth/Compiler.nvim/wiki/solution-examples).

## Build automation utilities (optional)
If any of these files exist in your current working directory, they will be automatically detected and displayed on [Compiler.nvim](https://github.com/Zeioth/compiler.nvim): 

| Build automation utility | More info |
|--|--|
| [Makefile](https://github.com/Zeioth/compiler.nvim/blob/main/lua/compiler/bau/make.lua)| [+info](https://github.com/Zeioth/Compiler.nvim/wiki/Makefile-build-automation-utility) | 
| [CMakeLists.txt](https://github.com/Zeioth/compiler.nvim/blob/main/lua/compiler/bau/cmake.lua) | [+info](https://github.com/Zeioth/Compiler.nvim/wiki/CMake-build-automation-utility) |
| [build.gradle](https://github.com/Zeioth/compiler.nvim/blob/main/lua/compiler/bau/gradle.lua) | [+info](https://github.com/Zeioth/Compiler.nvim/wiki/gradle-build-automation-utility) |

## Quick start
Create `~/c-example/main.c` and paste this code. Then do `:cd ~/c-example/` to change the working directory to the project.

```c
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}
```

Open the compiler and select `Build and run`. You will see the compilation results.

![screenshot_2023-07-25_23-56-57_069109256](https://github.com/Zeioth/compiler.nvim/assets/3357792/fd102350-ca44-4501-9cb0-db2ea0093264)

## FAQ
* **I get errors when compiling:** You have to  `:cd /your/project/root_dir` before calling [Compiler.nvim](https://starchart.cc/Zeioth/Compiler.nvim).
* **How can I auto `:cd` my projects?** Use [this fork](https://github.com/ahmedkhalf/project.nvim/pull/131) of the plugin `project.nvim`.
* **I don't have time to read:** If you prefer you can try [NormalNvim](https://github.com/NormalNvim/NormalNvim) which comes with the compiler pre-installed. Just open some code and hit F6!
* **How can I add a language that is not supported yet?** Fork the project, and go to the directory `/compiler/languages`. Copy `c.lua` and rename it to any language you would like to add, for example `ruby.lua`. Now modify the file the way you want. It is important you name the file as the filetype of the language you are implementing. Then please, submit a PR to this repo so everyone can benefit from it.
* **How can I change the way the compiler works?** Same as the previous one.
* **How can I add an automation build utility that is not supported yet?** Fork the project, and go to the directory `/compiler/bau`. Copy `make.lua` and rename it to the build automation utility you want to add, for example `maven.lua`. Now modify the file the way you want. Note that you will also have to modify `/utilities-bau.lua` and change the function `get_bau_opts()` so it can parse the utility you want to add. Then please, submit a PR to this repo so everyone can benefit from it.
* **Is this plugin just a compiler, or can I run scripts too?** Yes you can. But if your script receive arguments, we recommend you to use the terminal instead, because creating a `.solution.toml` file just to be able to pass arguments to your simple shell script is probably a overkill, and not the right tool.
* **I'm a windows user, do I need to do something special?** You have to [enable WSL](https://www.youtube.com/watch?v=fFbLUEQsRhM), and run nvim inside. Otherwise it would be impossible for you to install the [required dependencies](https://github.com/Zeioth/Compiler.nvim/wiki/how-to-install-the-required-dependencies).
*  **How can I disable notifications when compiling?** Check [here](https://github.com/stevearc/overseer.nvim/issues/158#issuecomment-1631542247).
* **I'm coding a web, how do I run it?** Please don't try to compile/run web languages. I recommend you this strategy instead:
  
  * A way to transpile: toggleterm + tmux.
  * A way run the project: Just keep the website opened in your browser.
* **Do this plugin also support build automation utilities?** We are currently adding this feature. You can check if yours is supported [here](https://github.com/Zeioth/compiler.nvim/wiki/Makefile-examples#supported-build-automation-tools).

### How can I compile videogames?
The workflow of game development is essentially very different from just compiling and running a program. It involve loading editing and running scenes. While there is no way for us to support it directly, here I offer you some tricks:

#### Godot engine
To `Build and run a godot scene`, use the command `godot /my/scene.tscn` on the terminal. This works really well: It's fast and simple.

#### Unity
The recommended way is to have 2 monitors, one with nvim and your code, and another one with your unity scenes to run the game. Unity has [some terminal commands](https://docs.unity3d.com/Manual/CommandLineArguments.html), but working with them is quite a painful experience.

## 🌟 Support the project
If you want to help me, please star this repository to increase the visibility of the project.

[![Stargazers over time](https://starchart.cc/Zeioth/Compiler.nvim.svg)](https://starchart.cc/Zeioth/Compiler.nvim)


## Thanks to all contributors

<a href="https://github.com/zeioth/compiler.nvim/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=zeioth/compiler.nvim" />
</a>

## Roadmap
* `minor bugfix`: Build automation utilities are not repeated when using `:CompilerRedo`.
* `Improvement`: We currently display Flutter compiling options when using Dart. We also show Android studio compiling options when using Kotlin, but we are not doing the same thing for java. → In fact we should add all of this as building system system (gradle), instead of adding it as part of the language compiler options. That would allow us to display these options only when present in the Android build.gradle.
* `Building systems → maven` is planned. Auto discovery of options defined by the user is planned.
* `Building systems → package.json` is planned. Auto discovery of options defined by the user is planned.
* Consider adding rake support.
* Better Windows compatibility when not using WSL: The commands `rm -rf` and `mkdir -p` only exist on unix. To support Windows without WSL we should run the equivalent powershell command when Windows is detected.
* Aditionally, we will also have to compile for `asm` win64 architecture, if the detected OS is windows.
* Aditionally, we will also have to add an option to compile for `Build for windows (flutter)`.
