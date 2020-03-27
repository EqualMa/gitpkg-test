load ../setup_teardown
load ../load_pkg
load_pkg bats-file
load_pkg bats-support
load_pkg bats-assert

PKG_MANAGER=yarn

@test "yarn > GitPkg Simplest API > master > hello" {
  run yarn add "$TEST_GITPKG_URL/EqualMa/gitpkg-hello/packages/hello"
  result="$(node -e 'console.log(require("hello").hello("w"))')"
  assert_equal "$result" 'Hello w!'
}

@test "yarn > GitPkg Simplest API > master > hello (explicitly specify commit)" {
  run yarn add "$TEST_GITPKG_URL/EqualMa/gitpkg-hello/packages/hello?master"
  result="$(node -e 'console.log(require("hello").hello("w"))')"
  assert_equal "$result" 'Hello w!'
}

@test "yarn > GitPkg Formal API > master > hello" {
  run yarn add "$TEST_GITPKG_URL/api/pkg?url=EqualMa/gitpkg-hello/packages/hello"
  result="$(node -e 'console.log(require("hello").hello("w"))')"
  assert_equal "$result" 'Hello w!'
}

@test "yarn > GitPkg Formal API > master > hello (explicitly specify commit)" {
  run yarn add "$TEST_GITPKG_URL/api/pkg?url=EqualMa/gitpkg-hello/packages/hello&commit=master"
  result="$(node -e 'console.log(require("hello").hello("w"))')"
  assert_equal "$result" 'Hello w!'
}

@test "yarn > GitPkg Simplest API > branch-a > hello" {
  run yarn add "$TEST_GITPKG_URL/EqualMa/gitpkg-hello/packages/hello?branch-a"
  result="$(node -e 'console.log(require("hello").hello("w"))')"
  assert_equal "$result" 'Hello w from branch-a!'
}

@test "yarn > GitPkg Formal API > branch-a > hello" {
  run yarn add "$TEST_GITPKG_URL/api/pkg?url=EqualMa/gitpkg-hello/packages/hello&commit=branch-a"
  result="$(node -e 'console.log(require("hello").hello("w"))')"
  assert_equal "$result" 'Hello w from branch-a!'
}
