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
mkdir -p ca/private ca/private
chmod 0700 ca/private


##### Setup server certificate


##### Setup client certificates
