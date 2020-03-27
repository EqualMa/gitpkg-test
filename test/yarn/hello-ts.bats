load ../setup_teardown
load ../load_pkg
load_pkg bats-file
load_pkg bats-support
load_pkg bats-assert

PKG_MANAGER=yarn

@test "yarn > GitPkg Simplest API > master > hello-ts (explicitly specify commit)" {
  run yarn add "$TEST_GITPKG_URL/EqualMa/gitpkg-hello/packages/hello-ts?master&scripts.postinstall=yarn%20install%20--ignore-scripts%20%26%26%20yarn%20build"
  result="$(node -e 'console.log(require("hello-ts").hello("w"))')"
  assert_equal "$result" 'Hello w from TypeScript!'
}

@test "yarn > GitPkg Formal API > master > hello-ts" {
  run yarn add "$TEST_GITPKG_URL/api/pkg?url=EqualMa/gitpkg-hello/packages/hello-ts&scripts.postinstall=yarn%20install%20--ignore-scripts%20%26%26%20yarn%20build"
  result="$(node -e 'console.log(require("hello-ts").hello("w"))')"
  assert_equal "$result" 'Hello w from TypeScript!'
}

@test "yarn > GitPkg Formal API > master > hello-ts (explicitly specify commit)" {
  run yarn add "$TEST_GITPKG_URL/api/pkg?url=EqualMa/gitpkg-hello/packages/hello-ts&commit=master&scripts.postinstall=yarn%20install%20--ignore-scripts%20%26%26%20yarn%20build"
  result="$(node -e 'console.log(require("hello-ts").hello("w"))')"
  assert_equal "$result" 'Hello w from TypeScript!'
}

@test "yarn > GitPkg Simplest API > branch-a > hello-ts" {
  run yarn add "$TEST_GITPKG_URL/EqualMa/gitpkg-hello/packages/hello-ts?branch-a&scripts.postinstall=yarn%20install%20--ignore-scripts%20%26%26%20yarn%20build"
  result="$(node -e 'console.log(require("hello-ts").hello("w"))')"
  assert_equal "$result" 'Hello w from TypeScript in branch-a!'
}

@test "yarn > GitPkg Formal API > branch-a > hello-ts" {
  run yarn add "$TEST_GITPKG_URL/api/pkg?url=EqualMa/gitpkg-hello/packages/hello-ts&commit=branch-a&scripts.postinstall=yarn%20install%20--ignore-scripts%20%26%26%20yarn%20build"
  result="$(node -e 'console.log(require("hello-ts").hello("w"))')"
  assert_equal "$result" 'Hello w from TypeScript in branch-a!'
}
