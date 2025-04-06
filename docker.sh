set -o nounset

readonly IMAGE=rust-cli-template:1

readonly HOST_WORK_DIR="$(pwd)"
readonly CONT_WORK_DIR="${HOME}/work"

cmd_build() {
  docker build \
    --build-arg user=$USER \
    --build-arg group=$(id -gn) \
    --progress plain \
    -t $IMAGE .
}

cmd_run_it() {
  docker run --rm -it \
    -v "${HOST_WORK_DIR}:${CONT_WORK_DIR}" \
    $IMAGE "$@"
}

cmd_run() {
  docker run --rm -i \
    -v "${HOST_WORK_DIR}:${CONT_WORK_DIR}" \
    $IMAGE "$@"
}

cmd="$1"; shift
case $cmd in
  build )
    cmd_build "$@"
;; run-it )
     cmd_run_it "$@"
;; run )
     cmd_run "$@"
;; * )
     echo "invalid command (${cmd})" >&2
     ;;
esac
