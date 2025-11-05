set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOGDIR="$HOME/maint_suite/maint_logs"
BACKUPDIR="$HOME/maint_suite/maint_backups"
mkdir -p "$LOGDIR" "$BACKUPDIR"
timestamp(){ date +'%F %T'; }
log(){ echo "[$(timestamp)] $*" | tee -a "$LOGDIR/backup.log"; }
LOG="$LOGDIR/backup.log"
RETENTION_DAYS=7
DATE=$(date +%F-%H%M)
TMP_ARCHIVE="/tmp/backup-$DATE.tar.gz"
FINAL_ARCHIVE="$BACKUPDIR/backup-$DATE.tar.gz"
SRC_DIRS=( "$HOME" )
EXCLUDES=( "$BACKUPDIR" "$HOME/.cache" "$HOME/.local/share/Trash" "$HOME/node_modules" "/proc" "/sys" "/dev" "/run" "/tmp" "/mnt" )
EXCLUDE_ARGS=()
for e in "${EXCLUDES[@]}"; do EXCLUDE_ARGS+=( "--exclude=$e" ); done
log "Starting backup (temp -> $TMP_ARCHIVE)"
command -v tar >/dev/null 2>&1 || { log "tar not found"; exit 2; }
if tar --warning=no-file-changed --ignore-failed-read -czf "$TMP_ARCHIVE" "${EXCLUDE_ARGS[@]}" "${SRC_DIRS[@]}" 2> >(grep -v -E 'Cannot open|Permission denied' >>"$LOG"); then
  log "Created temp archive: $TMP_ARCHIVE"
else
  log "tar finished with warnings (see $LOG for filtered details)"
fi
if [ -f "$TMP_ARCHIVE" ] && [ -s "$TMP_ARCHIVE" ]; then
  mv "$TMP_ARCHIVE" "$FINAL_ARCHIVE"
  log "Moved to $FINAL_ARCHIVE"
else
  log "No archive created; aborting move"
  [ -f "$TMP_ARCHIVE" ] && rm -f "$TMP_ARCHIVE"
  exit 1
fi
find "$BACKUPDIR" -maxdepth 1 -type f -name 'backup-*.tar.gz' -mtime +"$RETENTION_DAYS" -print -delete >>"$LOG" 2>&1 || true
log "Backup completed"
