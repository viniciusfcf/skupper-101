skupper init --enable-console --enable-flow-collector --console-auth unsecured
skupper gateway init --type docker
skupper expose service database --address database --port 5432 --protocol tcp
# N funciona no mac
skupper gateway bind database localhost 5432
