# Test PKI
This folder contains config and scripts to setup a test-pki with a Root CA, an intermediate CA, server and client certificates and follows a simplified version of the workflow described in this [tutorial](https://pki-tutorial.readthedocs.io/en/latest/advanced/index.html) to set up a real pki please follow the original tutorial and do not use these scripts and configuration files.

./setup.sh will generate the PKI and some certificates

The `setup.sh` script will prompt you for passwords to encrypt and decrypt key files and will ask you to confirm several actions with `y`. Just use any password here, I usually use `test`. Just be sure not to use any of these certificates for anything other than testing.

the `root` directory will contain the root ca certificate and corresponding files
the `ca` directory will contain an intermediate certificate, signed by the root, and related files

the `server` directory will contain the server certificate
the `client` directory will contain two client certificates


Use ./clean.sh to remove all generated test-certificates and database files.
