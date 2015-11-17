after_install autoalias

autoalias() {
  if [ "$STATUS" = 0 ]; then
    case "$VERSION_NAME" in
      *[0-9]-*-*)
        local patch="${VERSION_NAME%-*}"
        if [ ! -e "$RBENV_ROOT/$patch" ]; then
          # rbenv alias 1.9.3-p194 1.9.3-p194-perf
          rbenv alias "$patch" "$VERSION_NAME"
        fi
        ;;
    esac
    case "$VERSION_NAME" in
      *[0-9]-*)
        rbenv alias "${VERSION_NAME%-*}" --auto 2>/dev/null || true
        ;;
    esac
  fi
}
