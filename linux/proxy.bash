#!/bin/bash

# Este archivo se debe invocar desde el archivo .profile (con source, para que preserve las variables de entorno)

alias apt-get="sudo apt-get"
do_aux() {
  local startswith
  local ip=$( ifconfig | tr -s ' ' \
                | grep '^ inet ' | grep -v '127.0.0.1' \
                | cut -d ' ' -f3 )
  for startswith in 192.168.64. 192.168.65. 192.168.66.; do
    if [ "${startswith}" == "${ip:0:${#startswith}}" ]; then
      export {http,https,ftp}_proxy="http://proxy.indra.es:8080"
      export no_proxy='*.indraweb.net,*.indra.es,*.indrabmb.es'

      alias apt-get="sudo apt-get -o Acquire::http::Proxy=\"http://proxy.indra.es:8080\" -o Acquire::https::Proxy=\"http://proxy.indra.es:8080\""

      alias git="git -c \"http.proxy=proxy.indra.es:8080\" -c \"https.proxy=proxy.indra.es:8080\""
    fi
  done
}
do_aux
unset -f do_aux
