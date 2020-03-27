load ../setup_teardown
load ../load_pkg
load_pkg bats-file
load_pkg bats-support
load_pkg bats-assert

PKG_MANAGER=npm

@test "npm > GitPkg Simplest API > master > hello-ts (explicitly specify commit)" {
  run npm install "$TEST_GITPKG_URL/EqualMa/gitpkg-hello/packages/hello-ts?master&scripts.postinstall=npm%20install%20--ignore-scripts%20%26%26%20npm%20run%20build"
  result="$(node -e 'console.log(require("hello-ts").hello("w"))')"
  assert_equal "$result" 'Hello w from TypeScript!'
}

@test "npm > GitPkg Formal API > master > hello-ts" {
  run npm install "$TEST_GITPKG_URL/api/pkg?url=EqualMa/gitpkg-hello/packages/hello-ts&scripts.postinstall=npm%20install%20--ignore-scripts%20%26%26%20npm%20run%20build"
  result="$(node -e 'console.log(require("hello-ts").hello("w"))')"
  assert_equal "$result" 'Hello w from TypeScript!'
}

@test "npm > GitPkg Formal API > master > hello-ts (explicitly specify commit)" {
  run npm install "$TEST_GITPKG_URL/api/pkg?url=EqualMa/gitpkg-hello/packages/hello-ts&commit=master&scripts.postinstall=npm%20install%20--ignore-scripts%20%26%26%20npm%20run%20build"
  result="$(node -e 'console.log(require("hello-ts").hello("w"))')"
  assert_equal "$result" 'Hello w from TypeScript!'
}

@test "npm > GitPkg Simplest API > branch-a > hello-ts" {
  run npm install "$TEST_GITPKG_URL/EqualMa/gitpkg-hello/packages/hello-ts?branch-a&scripts.postinstall=npm%20install%20--ignore-scripts%20%26%26%20npm%20run%20build"
  result="$(node -e 'console.log(require("hello-ts").hello("w"))')"
  assert_equal "$result" 'Hello w from TypeScript in branch-a!'
}

@test "npm > GitPkg Formal API > branch-a > hello-ts" {
  run npm install "$TEST_GITPKG_URL/api/pkg?url=EqualMa/gitpkg-hello/packages/hello-ts&commit=branch-a&scripts.postinstall=npm%20install%20--ignore-scripts%20%26%26%20npm%20run%20build"
  result="$(node -e 'console.log(require("hello-ts").hello("w"))')"
  assert_equal "$result" 'Hello w from TypeScript in branch-a!'
}
