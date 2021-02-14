##### Setup root-ca

    # Create directories and db
mkdir -p root/private root/db
chmod 0700 root/private

touch root/db/root.db
touch root/db/root.db.attr
echo 01 > root/db/root.crt.srl
echo 01 > root/db/root.crl.srl

    # Request and sign the certificate
openssl req -new -config root.conf -out root/root.csr -keyout root/private/root.key
openssl ca -selfsign -config root.conf -in root/root.csr -out root/root.crt -extensions root_ca_ext

    # Generate crl
openssl ca -gencrl -config root.conf -out root/root.crl


##### Setup intermediate ca and db

    # Create directories and db
mkdir -p tls_ca/private tls_ca/db
chmod 0700 tls_ca/private

touch tls_ca/db/tls_ca.db
touch tls_ca/db/tls_ca.db.attr
echo 01 > tls_ca/db/tls_ca.crt.srl
echo 01 > tls_ca/db/tls_ca.crl.srl

    # Request and sign the certificate
openssl req -new -config tls_ca.conf -out tls_ca/tls_ca.csr -keyout tls_ca/private/tls_ca.key
openssl ca -config root.conf -in tls_ca/tls_ca.csr -out tls_ca/tls_ca.crt -extensions signing_ca_ext

openssl ca -gencrl -config tls_ca.conf -out tls_ca/tls_ca.crl

cat tls_ca/tls_ca.crt root/root.crt > tls_ca/tls_ca_chain.pem


##### Setup server certificate


##### Setup client certificates
