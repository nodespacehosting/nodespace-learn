---
hide:
 - toc
---
# How SSL Works

The logic behind SSL certificates is to encrypt traffic between a client (commonly a web browser) and the server. This prevents interception of the traffic. The client encrypts data using the server's public key and the server decrypts the data using it's private key. This is known as Public Key Infrastructure or PKI.

In a nutshell, this is basically how it works (note: this is simplified):

![SSL Logic](images/ssl-logic.png)

Once the secure connection is established, traffic is encrypted and cannot be decoded by anyone without the private key.

1. The client requests a secure connection to the server.
2. The server sends the client a copy of it's SSL certificate.
3. The client verifies the certificate is valid and trusted.
4. The client generates a random symmetric key and encrypts it using the server's public key.
5. The client sends the encrypted symmetric key to the server.
6. The server decrypts the symmetric key using it's private key.
7. The server and client use the symmetric key to encrypt and decrypt data during the session.
