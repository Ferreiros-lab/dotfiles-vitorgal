cleanup_brew() {
  brew cleanup --force
  rm -rf "$(brew --cache)"
}

cleanup_error_log() {
  sed -i '' '/^Downloading /d;/^-> /d;/^Installing /d;/^Installed /d' "${error_log}" # pyenv downloads
  sed -i '' -E '/#{2,}.*%/d' "${error_log}" # curl progress bars
  sed -i '' '/^Cloning into/d' "${error_log}" # git cloning messages
}

move_manual_action_files() {
  mv "${helper_files}" "${post_install_files}"
  mv "${post_install_files}/post_install_script.sh" "${post_install_script}"
}

final_message() {
  clear

  echo "All the automated scripts have now finished.
    'stderr' has been logged to '${error_log}'.

    There are still a few operations that should be completed manually.

    - In '${post_install_files}', there are configurations that will need to be manually applied.
      File names should be self-explanatory.
    - There is also '${post_install_script}', that pertains to changes to the behaviour of the OS itself.
      Read it to make sure its options are still desirable (or needed, even).
  " | sed -E 's/ {4}//'

  local execute_post_install_script='false'
  until [[ "${execute_post_install_script}" =~ ^[yn]$ ]]; do
    read -n1 -p "$(bold_echo "Should we execute $(basename ${post_install_script}) now? (y/n) ")" execute_post_install_script

    if [[ "${execute_post_install_script}" == 'y' ]]; then
      bash "${post_install_script}"
    elif [[ "${execute_post_install_script}" == 'n' ]]; then
      echo -e "\n"
      break
    fi
  done
}
