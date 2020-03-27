load_pkg() {
  local name="$1"
  load "$(node -e "console.log(require.resolve('$name/load.bash'))")"
}
