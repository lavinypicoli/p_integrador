class APIResponse<T> {
  bool ok;
  String msg;
  T result;

  APIResponse.ok(this.result) {
    ok = true;
  }

  APIResponse.error(this.msg) {
    ok = false;
  }
}
