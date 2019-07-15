if uname -a | grep -q Darwin
  set -x DEP_OPENSSL_INCLUDE /usr/local/opt/openssl/include
  set -x OPENSSL_INCLUDE_DIR /usr/local/opt/openssl/include
  set -x OPENSSL_LIB_DIR /usr/local/opt/openssl/lib
  set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
  set -g fish_user_paths "/usr/local/opt/apr/bin" $fish_user_paths
  set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
  set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
  set -gx CFLAGS "-I/usr/local/opt/openssl@1.1/include"
end
