
setup(){
    if [[ ! -f "$BINARY" ]]; then
        echo "missing student binary"
        return 1
    fi
}

should_succeed_with_output() {
  ref_file_name=$1
  args="${@:2}"
  declare -i exit_success_return_val=0
  run timeout 1 $BINARY $args
  echo "$output" > $STUDENT_OUTPUT/$ref_file_name
  echo "Exit code is $status and should be $exit_success_return_val"
  echo "Diff to expected output:"
  output_diff="$(echo "$output" | diff - $REF_DATA/output/$ref_file_name || true)"
  echo "$output_diff"
  [ "$status" -eq 0 ]
  [ -z "$(echo "$output" | diff - $REF_DATA/output/$ref_file_name)" ]
}

should_return_exit_failure() {
  args="$@"
  declare -i exit_failure_return_val=1
  run timeout 1 $BINARY $args
  echo "Exit code is $status and should be $exit_failure_return_val"
  echo "Verbatim output:"
  echo "$output"

  [ "$status" -eq "$exit_failure_return_val" ]
}

@test "full announcment example" {
  should_succeed_with_output 1239.txt 1234 5
}

@test "random nonsense agrument" {
  should_return_exit_failure nonsense
}

@test "no argument" {
  should_return_exit_failure
}

