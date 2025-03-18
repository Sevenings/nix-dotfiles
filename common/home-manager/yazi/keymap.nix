{ ... }:

{
  programs.yazi.keymap = {

    manager = {
      
      keymap = [
        { on = [ "<Esc>" ]; run = "escape";             desc = "Exit visual mode, clear selected, or cancel search"; }
        { on = [ "<C-[>" ]; run = "escape";             desc = "Exit visual mode, clear selected, or cancel search"; }
        { on = [ "q" ];     run = "quit";               desc = "Exit the process"; }
        { on = [ "Q" ];     run = "quit --no-cwd-file"; desc = "Exit the process without writing cwd-file"; }
        { on = [ "<C-q>" ]; run = "close";              desc = "Close the current tab, or quit if it is last tab"; }
        { on = [ "<C-z>" ]; run = "suspend";            desc = "Suspend the process"; }

        # Navigation
        { on = [ "k" ]; run = "arrow -1"; desc = "Move cursor up"; }
        { on = [ "j" ]; run = "arrow 1";  desc = "Move cursor down"; }

        { on = [ "K" ]; run = "arrow -5"; desc = "Move cursor up 5 lines"; }
        { on = [ "J" ]; run = "arrow 5";  desc = "Move cursor down 5 lines"; }

        { on = [ "<S-Up>" ];   run = "arrow -5"; desc = "Move cursor up 5 lines"; }
        { on = [ "<S-Down>" ]; run = "arrow 5";  desc = "Move cursor down 5 lines"; }

        { on = [ "<C-u>" ]; run = "arrow -50%";  desc = "Move cursor up half page"; }
        { on = [ "<C-d>" ]; run = "arrow 50%";   desc = "Move cursor down half page"; }
        { on = [ "<C-b>" ]; run = "arrow -100%"; desc = "Move cursor up one page"; }
        { on = [ "<C-f>" ]; run = "arrow 100%";  desc = "Move cursor down one page"; }

        { on = [ "<C-PageUp>" ];   run = "arrow -50%";  desc = "Move cursor up half page"; }
        { on = [ "<C-PageDown>" ]; run = "arrow 50%";   desc = "Move cursor down half page"; }
        { on = [ "<PageUp>" ];     run = "arrow -100%"; desc = "Move cursor up one page"; }
        { on = [ "<PageDown>" ];   run = "arrow 100%";  desc = "Move cursor down one page"; }

        { on = [ "h" ]; run = "leave"; desc = "Go back to the parent directory"; }
        { on = [ "l" ]; run = "plugin --sync smart-enter"; desc = "Enter the child directory"; }

        { on = [ "<A-k>" ];         run = "seek -5";        desc = "Seek up 5 units in the preview"; }
        { on = [ "<A-j>" ];         run = "seek 5";         desc = "Seek down 5 units in the preview"; }
        { on = [ "<A-PageUp>" ];    run = "seek -5";        desc = "Seek up 5 units in the preview"; }
        { on = [ "<A-PageDown>" ];  run = "seek 5";         desc = "Seek down 5 units in the preview"; }

        { on = [ "<Up>" ];    run = "arrow -1"; desc = "Move cursor up"; }
        { on = [ "<Down>" ];  run = "arrow 1";  desc = "Move cursor down"; }
        { on = [ "<Left>" ];  run = "leave";    desc = "Go back to the parent directory"; }
        { on = [ "<Right>" ]; run = "enter";    desc = "Enter the child directory"; }

        { on = [ "g" "g" ]; run = "arrow top";  desc = "Move cursor to the top"; }
        { on = [ "G" ];      run = "arrow up";  desc = "Move cursor to the bottom"; }

        # Selection
        # { on = [ "<Space>" ]; run = [ "select --state=none"; "arrow 1" ], desc = "Toggle the current selection state"; }
        { on = [ "v" ];       run = "visual_mode";                        desc = "Enter visual mode (selection mode)"; }
        { on = [ "V" ];       run = "visual_mode --unset";                desc = "Enter visual mode (unset mode)"; }
        { on = [ "<C-a>" ];   run = "select_all --state=true";            desc = "Select all files"; }
        { on = [ "<C-r>" ];   run = "select_all --state=none";            desc = "Inverse selection of all files"; }

        # Operation
        { on = [ "o" ];         run = "plugin --sync smart-enter";  desc = "Open the selected files"; }
        { on = [ "O" ];         run = "open --interactive";         desc = "Open the selected files interactively"; }
        { on = [ "<Enter>" ];   run = "enter";                      desc = "Open the selected files"; }
        { on = [ "<C-Enter>" ]; run = "open --interactive";         desc = "Open the selected files interactively"; }
        { on = [ "l" ];         run = "open";                       desc = "Open the selected files"; }
        { on = [ "y" "y" ];    run = "yank";                        desc = "Copy the selected files"; }
        { on = [ "Y" ];         run = "unyank";                     desc = "Cancel the yank status of files"; }
        { on = [ "d" "d" ];    run = "yank --cut";                  desc = "Cut the selected files"; }
        { on = [ "p" ];         run = "paste";                      desc = "Paste the files"; }
        { on = [ "P" ];         run = "paste --force";              desc = "Paste the files (overwrite if the destination exists)"; }
        { on = [ "-" ];         run = "link";                       desc = "Symlink the absolute path of files"; }
        { on = [ "_" ];         run = "link --relative";            desc = "Symlink the relative path of files"; }
        { on = [ "d" "D" ];    run = "remove";                      desc = "Move the files to the trash"; }
        { on = [ "D" "D" ];    run = "remove --permanently";        desc = "Permanently delete the files"; }
        { on = [ "a" ];         run = "create";                     desc = "Create a file or directory (ends with / for directories)"; }
        { on = [ "A" ];         run = "create --dir";               desc = "Create a directory"; }
        { on = [ "<F7>" ];      run = "create --dir";               desc = "Create a directory"; }
        { on = [ "r" ];         run = "rename --cursor=before_ext"; desc = "Rename a file or directory"; }
        { on = [ "s" ];         run = "shell --interactive";        desc = "Run a shell command"; }
        { on = ["<Backspace>"]; run = "hidden toggle";              desc = "Toggle the visibility of hidden files"; }
        { on = [ "<C-s>" ];     run = "search none";                desc = "Cancel the ongoing search"; }

        # Sudo Operations
        { on = ["S" "p"];      run = "plugin sudo --args='paste'";      desc = "sudo Paste"; }
        { on = ["S" "r"];      run = "plugin sudo --args='rename'";     desc = "sudo Rename"; }
        { on = ["S" "_"];      run = "plugin sudo --args='link'";       desc = "sudo Link"; }
        { on = ["S" "a"];      run = "plugin sudo --args='create'";     desc = "sudo Create"; }
        { on = ["S" "d" "D"]; run = "plugin sudo --args='remove'";      desc = "sudo Trash"; }
        { on = ["S" "D" "D"]; run = "plugin sudo --args='remove -P'";   desc = "sudo Delete"; }
        { on = ["S" "e"];      run = "plugin sudo --args='edit'";       desc = "sudo Edit"; }

        # Linemode
        { on = [ "m" "s" ]; run = "linemode size";        desc = "Set linemode to size"; }
        { on = [ "m" "p" ]; run = "linemode permissions"; desc = "Set linemode to permissions"; }
        { on = [ "m" "m" ]; run = "linemode mtime";       desc = "Set linemode to mtime"; }
        { on = [ "m" "n" ]; run = "linemode none";        desc = "Set linemode to none"; }

        # Copy
        { on = [ "y" "p" ]; run = "copy path";             desc = "Copy the absolute path"; }
        { on = [ "y" "d" ]; run = "copy dirname";          desc = "Copy the path of the parent directory"; }
        { on = [ "y" "n" ]; run = "copy filename";         desc = "Copy the name of the file"; }
        { on = [ "y" "N" ]; run = "copy name_without_ext"; desc = "Copy the name of the file without the extension"; }

        # Filter
        { on = [ "f" ]; run = "plugin smart-filter"; desc = "Smart Filter"; }

        # Find
        { on = [ "/" ]; run = "find --smart";            desc = "Find next file"; }
        { on = [ "?" ]; run = "find --previous --smart"; desc = "Find previous file"; }
        { on = [ "n" ]; run = "find_arrow";              desc = "Go to next found file"; }
        { on = [ "N" ]; run = "find_arrow --previous";   desc = "Go to previous found file"; }

        # Sorting
        { on = [ "," "m" ]; run = "sort modified --dir-first";               desc = "Sort by modified time"; }
        { on = [ "," "M" ]; run = "sort modified --reverse --dir-first";     desc = "Sort by modified time (reverse)"; }
        { on = [ "," "c" ]; run = "sort created --dir-first";                desc = "Sort by created time"; }
        { on = [ "," "C" ]; run = "sort created --reverse --dir-first";      desc = "Sort by created time (reverse)"; }
        { on = [ "," "e" ]; run = "sort extension --dir-first";         	   desc = "Sort by extension"; }
        { on = [ "," "E" ]; run = "sort extension --reverse --dir-first";    desc = "Sort by extension (reverse)"; }
        { on = [ "," "a" ]; run = "sort alphabetical --dir-first";           desc = "Sort alphabetically"; }
        { on = [ "," "A" ]; run = "sort alphabetical --reverse --dir-first"; desc = "Sort alphabetically (reverse)"; }
        { on = [ "," "n" ]; run = "sort natural --dir-first";                desc = "Sort naturally"; }
        { on = [ "," "N" ]; run = "sort natural --reverse --dir-first";      desc = "Sort naturally (reverse)"; }
        { on = [ "," "s" ]; run = "sort size --dir-first";                   desc = "Sort by size"; }
        { on = [ "," "S" ]; run = "sort size --reverse --dir-first";         desc = "Sort by size (reverse)"; }

        # Tabs
        { on = [ "t" ]; run = "tab_create --current"; desc = "Create a new tab using the current path"; }

        { on = [ "1" ]; run = "tab_switch 0"; desc = "Switch to the first tab"; }
        { on = [ "2" ]; run = "tab_switch 1"; desc = "Switch to the second tab"; }
        { on = [ "3" ]; run = "tab_switch 2"; desc = "Switch to the third tab"; }
        { on = [ "4" ]; run = "tab_switch 3"; desc = "Switch to the fourth tab"; }
        { on = [ "5" ]; run = "tab_switch 4"; desc = "Switch to the fifth tab"; }
        { on = [ "6" ]; run = "tab_switch 5"; desc = "Switch to the sixth tab"; }
        { on = [ "7" ]; run = "tab_switch 6"; desc = "Switch to the seventh tab"; }
        { on = [ "8" ]; run = "tab_switch 7"; desc = "Switch to the eighth tab"; }
        { on = [ "9" ]; run = "tab_switch 8"; desc = "Switch to the ninth tab"; }

        { on = [ "[" ]; run = "tab_switch -1 --relative"; desc = "Switch to the previous tab"; }
        { on = [ "]" ]; run = "tab_switch 1 --relative";  desc = "Switch to the next tab"; }

        { on = [ "{" ]; run = "tab_swap -1"; desc = "Swap the current tab with the previous tab"; }
        { on = [ "}" ]; run = "tab_swap 1";  desc = "Swap the current tab with the next tab"; }

        # Tasks
        { on = [ "w" ]; run = "tasks_show"; desc = "Show the tasks manager"; }

        # Goto
        { on = [ "g" "<Space>" ];  run = "cd --interactive";                       desc = "Go to a directory interactively"; }
        { on = [ "g" "h" ];        run = "cd ~";                                   desc = "Go to home"; }
        { on = [ "g" "c" ];        run = "cd ~/.config";                           desc = "Go to .config"; }
        { on = [ "g" "." ];        run = "cd ~/.dotfiles";                         desc = "Go to .dotfiles"; }
        { on = [ "g" "a" ];        run = "cd ~/Documentos/atividades";             desc = "Go to atividades"; }
        { on = [ "g" "b" ];        run = "cd ~/Documentos/'biblioteca de babel'";  desc = "Go to babel"; }
        { on = [ "g" "t" ];        run = "cd '~/Estagio TCE/atividades/15 Apresentação Machine Learning/'";          desc = "Go to Projetos Estagio"; }
        { on = [ "g" "T" ];        run = "cd ~/.local/share/Trash";                desc = "Go to Trash Can"; }
        { on = [ "g" "p" ];        run = "cd ~/Projetos";                          desc = "Go to Projetos"; }
        { on = [ "g" "P" ];        run = "cd ~/Playground";                        desc = "Go to Playground"; }
        { on = [ "g" "s" ];        run = "cd ~/Imagens/Screenshots";               desc = "Go to Screenshots"; }
        { on = [ "g" "/" ];        run = "cd /";                                   desc = "Go to Root"; }
        { on = [ "g" "i" ];        run = "cd ~/Imagens";                           desc = "Go to Imagens"; }
        { on = [ "g" "m" ];        run = "cd ~/Musicas";                           desc = "Go to Musicas"; }
        { on = [ "g" "v" ];        run = "cd ~/Videos";                            desc = "Go to Videos"; }
        { on = [ "g" "d" "c" ];    run = "cd ~/Documentos";                        desc = "Go to Documentos"; }
        { on = [ "g" "d" "w" ];    run = "cd ~/Downloads";                         desc = "Go to Downloads"; }
        { on = [ "g" "d" "d" ];    run = "cd /run/media/zenitsu";                  desc = "Go to Pendrives"; }
        { on = [ "g" "e" ];        run = "cd ~/Documentos/'Estudos Espiritismo'";  desc = "Go to Estudos Espiritismo"; }
        { on = [ "g" "n" ];        run = "cd /etc/nixos/";                         desc = "Go to Nixos"; }

        # Plugins / Extras

        # Drag and Drop # [D]rop [F]ile
        { on = [ "d" "f" ];        run = '' shell --confirm 'dragon -x -a "$@"' '';    desc = "Drag n Drop"; }

        # Create Template File
        { on = [ "c" "e" ];       run = "plugin new-project";    desc = "New Project"; }
        { on = [ "c" "t" ];       run = "plugin load-template";  desc = "Load Template"; }

        # Zip and Unzip
        { on = [ "z" "z" ];       run = '' shell --confirm 'zip -r "$1".zip "$1"' '';    desc = "Zip folder"; }
        { on = [ "z" "u" ];       run = '' shell --confirm 'unzip "$1"' '';    desc = "Unzip file"; }

        # Trash can 
        #{ on = [ "T", "r" ],       run = "shell '~/.config/yazi/scripts/trash-restore.sh' --confirm",    desc = "Restore"; }

        # Help
        { on = [ "g" "?" ]; run = "help"; desc = "Open help"; }

        # Lazygit
        { on = [ "<Space>" "l" "g" ]; run = "plugin lazygit"; desc = "Lazy Git"; }
      ];

      tasks = {
        keymap = [
          { on = [ "<Esc>" ]; run = "close"; desc = "Hide the task manager"; }
          { on = [ "<C-[>" ]; run = "close"; desc = "Hide the task manager"; }
          { on = [ "<C-q>" ]; run = "close"; desc = "Hide the task manager"; }
          { on = [ "w" ];     run = "close"; desc = "Hide the task manager"; }

          { on = [ "k" ]; run = "arrow -1"; desc = "Move cursor up"; }
          { on = [ "j" ]; run = "arrow 1";  desc = "Move cursor down"; }

          { on = [ "<Up>" ];   run = "arrow -1"; desc = "Move cursor up"; }
          { on = [ "<Down>" ]; run = "arrow 1";  desc = "Move cursor down"; }

          { on = [ "<Enter>" ]; run = "inspect"; desc = "Inspect the task"; }
          { on = [ "x" ];       run = "cancel";  desc = "Cancel the task"; }

          { on = [ "~" ]; run = "help"; desc = "Open help"; }
        ];
      };

      select = {
        keymap = [
          { on = [ "<Esc>" ];   run = "close";          desc = "Cancel selection"; }
          { on = [ "<C-[>" ];   run = "close";          desc = "Cancel selection"; }
          { on = [ "<C-q>" ];   run = "close";          desc = "Cancel selection"; }
          { on = [ "<Enter>" ]; run = "close --submit"; desc = "Submit the selection"; }

          { on = [ "k" ]; run = "arrow -1"; desc = "Move cursor up"; }
          { on = [ "j" ]; run = "arrow 1";  desc = "Move cursor down"; }

          { on = [ "K" ]; run = "arrow -5"; desc = "Move cursor up 5 lines"; }
          { on = [ "J" ]; run = "arrow 5";  desc = "Move cursor down 5 lines"; }

          { on = [ "<Up>" ];   run = "arrow -1"; desc = "Move cursor up"; }
          { on = [ "<Down>" ]; run = "arrow 1";  desc = "Move cursor down"; }

          { on = [ "<S-Up>" ];   run = "arrow -5"; desc = "Move cursor up 5 lines"; }
          { on = [ "<S-Down>" ]; run = "arrow 5";  desc = "Move cursor down 5 lines"; }

          { on = [ "~" ]; run = "help"; desc = "Open help"; }
        ];
      };

      input = {
        keymap = [
          { on = [ "<C-q>" ];   run = "close";          desc = "Cancel input"; }
          { on = [ "<Enter>" ]; run = "close --submit"; desc = "Submit the input"; }
          { on = [ "<Esc>" ];   run = "escape";         desc = "Go back the normal mode, or cancel input"; }
          { on = [ "<C-[>" ];   run = "escape";         desc = "Go back the normal mode, or cancel input"; }

          # Mode
          { on = [ "i" ]; run = "insert";                              desc = "Enter insert mode"; }
          { on = [ "a" ]; run = "insert --append";                     desc = "Enter append mode"; }
          { on = [ "I" ]; run = [ "move -999" "insert" ];              desc = "Move to the BOL, and enter insert mode"; }
          { on = [ "A" ]; run = [ "move 999" "insert --append" ];      desc = "Move to the EOL, and enter append mode"; }
          { on = [ "v" ]; run = "visual";                              desc = "Enter visual mode"; }
          { on = [ "V" ]; run = [ "move -999" "visual" "move 999" ];   desc = "Enter visual mode and select all"; }

          # Character-wise movement
          { on = [ "h" ];       run = "move -1"; desc = "Move back a character"; }
          { on = [ "l" ];       run = "move 1";  desc = "Move forward a character"; }
          { on = [ "<Left>" ];  run = "move -1"; desc = "Move back a character"; }
          { on = [ "<Right>" ]; run = "move 1";  desc = "Move forward a character"; }
          { on = [ "<C-b>" ];   run = "move -1"; desc = "Move back a character"; }
          { on = [ "<C-f>" ];   run = "move 1";  desc = "Move forward a character"; }

          # Word-wise movement
          { on = [ "b" ];     run = "backward";              desc = "Move back to the start of the current or previous word"; }
          { on = [ "w" ];     run = "forward";               desc = "Move forward to the start of the next word"; }
          { on = [ "e" ];     run = "forward --end-of-word"; desc = "Move forward to the end of the current or next word"; }
          { on = [ "<A-b>" ]; run = "backward";              desc = "Move back to the start of the current or previous word"; }
          { on = [ "<A-f>" ]; run = "forward --end-of-word"; desc = "Move forward to the end of the current or next word"; }

          # Line-wise movement
          { on = [ "0" ];      run = "move -999"; desc = "Move to the BOL"; }
          { on = [ "$" ];      run = "move 999";  desc = "Move to the EOL"; }
          { on = [ "<C-a>" ];  run = "move -999"; desc = "Move to the BOL"; }
          { on = [ "<C-e>" ];  run = "move 999";  desc = "Move to the EOL"; }
          { on = [ "<Home>" ]; run = "move -999"; desc = "Move to the BOL"; }
          { on = [ "<End>" ];  run = "move 999";  desc = "Move to the EOL"; }

          # Delete
          { on = [ "<Backspace>" ]; run = "backspace";	        desc = "Delete the character before the cursor"; }
          { on = [ "<Delete>" ];    run = "backspace --under"; desc = "Delete the character under the cursor"; }
          { on = [ "<C-h>" ];       run = "backspace";         desc = "Delete the character before the cursor"; }
          { on = [ "<C-d>" ];       run = "backspace --under"; desc = "Delete the character under the cursor"; }

          # Kill
          { on = [ "<C-u>" ]; run = "kill bol";      desc = "Kill backwards to the BOL"; }
          { on = [ "<C-k>" ]; run = "kill eol";      desc = "Kill forwards to the EOL"; }
          { on = [ "<C-w>" ]; run = "kill backward"; desc = "Kill backwards to the start of the current word"; }
          { on = [ "<A-d>" ]; run = "kill forward";  desc = "Kill forwards to the end of the current word"; }

          # Cut/Yank/Paste
          { on = [ "d" ]; run = "delete --cut";                               desc = "Cut the selected characters"; }
          { on = [ "D" ]; run = [ "delete --cut" "move 999" ];                desc = "Cut until the EOL"; }
          { on = [ "c" ]; run = "delete --cut --insert";                      desc = "Cut the selected characters, and enter insert mode"; }
          { on = [ "C" ]; run = [ "delete --cut --insert" "move 999" ];       desc = "Cut until the EOL, and enter insert mode"; }
          { on = [ "x" ]; run = [ "delete --cut" "move 1 --in-operating" ];   desc = "Cut the current character"; }
          { on = [ "y" ]; run = "yank";                                       desc = "Copy the selected characters"; }
          { on = [ "p" ]; run = "paste";                                      desc = "Paste the copied characters after the cursor"; }
          { on = [ "P" ]; run = "paste --before";                             desc = "Paste the copied characters before the cursor"; }

          # Undo/Redo
          { on = [ "u" ];     run = "undo"; desc = "Undo the last operation"; }
          { on = [ "<C-r>" ]; run = "redo"; desc = "Redo the last operation"; }

          # Help
          { on = [ "~" ]; run = "help"; desc = "Open help"; }
        ];
      };

      completion = {
        keymap = [
          { on = [ "<C-q>" ];   run = "close";                                      desc = "Cancel completion"; }
          { on = [ "<Tab>" ];   run = "close --submit";                             desc = "Submit the completion"; }
          { on = [ "<Enter>" ]; run = [ "close --submit" "close_input --submit" ];  desc = "Submit the completion and input"; }

          { on = [ "<A-k>" ]; run = "arrow -1"; desc = "Move cursor up"; }
          { on = [ "<A-j>" ]; run = "arrow 1";  desc = "Move cursor down"; }

          { on = [ "<Up>" ];   run = "arrow -1"; desc = "Move cursor up"; }
          { on = [ "<Down>" ]; run = "arrow 1";  desc = "Move cursor down"; }

          { on = [ "<C-p>" ]; run = "arrow -1"; desc = "Move cursor up"; }
          { on = [ "<C-n>" ]; run = "arrow 1";  desc = "Move cursor down"; }

          { on = [ "~" ]; run = "help"; desc = "Open help"; }
        ];
      };

      help = {
        keymap = [
          { on = [ "<Esc>" ]; run = "escape"; desc = "Clear the filter, or hide the help"; }
          { on = [ "<C-[>" ]; run = "escape"; desc = "Clear the filter, or hide the help"; }
          { on = [ "q" ];     run = "close";  desc = "Exit the process"; }
          { on = [ "<C-q>" ]; run = "close";  desc = "Hide the help"; }

          # Navigation
          { on = [ "k" ]; run = "arrow -1"; desc = "Move cursor up"; }
          { on = [ "j" ]; run = "arrow 1";  desc = "Move cursor down"; }

          { on = [ "K" ]; run = "arrow -5"; desc = "Move cursor up 5 lines"; }
          { on = [ "J" ]; run = "arrow 5";  desc = "Move cursor down 5 lines"; }

          { on = [ "<Up>" ];   run = "arrow -1"; desc = "Move cursor up"; }
          { on = [ "<Down>" ]; run = "arrow 1";  desc = "Move cursor down"; }

          { on = [ "<S-Up>" ];   run = "arrow -5"; desc = "Move cursor up 5 lines"; }
          { on = [ "<S-Down>" ]; run = "arrow 5";  desc = "Move cursor down 5 lines"; }

          # Filtering
          { on = [ "/" ]; run = "filter"; desc = "Apply a filter for the help items"; }
        ];
      };

    };
  };
}
