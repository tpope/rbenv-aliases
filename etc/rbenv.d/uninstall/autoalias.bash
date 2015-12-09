after_uninstall autoalias

autoalias() {
  case "$VERSION_NAME" in
  *[0-9]-*)
    rbenv alias "${VERSION_NAME%-*}" --auto 2>/dev/null || true
    rbenv alias "${VERSION_NAME%%-*}" --auto 2>/dev/null || true
    ;;
  *.*.*)
    rbenv alias "${VERSION_NAME%.*}" --auto 2>/dev/null || true
    ;;
  esac
}
