setup() {
  TEST_TEMP_DIR="$(temp_make)"
  TEST_PRE_DIR="$(pwd)"
  cd $TEST_TEMP_DIR

  if [ -z "$TEST_GITPKG_URL" ]
  then
    echo 'TEST_GITPKG_URL must be set'
    exit 1
  fi

  if [ "$PKG_MANAGER" = 'yarn' ]
  then
    yarn init -y
  elif [ "$PKG_MANAGER" = 'npm' ]
  then
    npm init -y
  else
    echo "PKG_MANAGER=$PKG_MANAGER not valid"
    exit 1
  fi
}

teardown() {
  cd $TEST_PRE_DIR
  temp_del "$TEST_TEMP_DIR"
}
