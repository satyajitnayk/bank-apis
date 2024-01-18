## Important Notes

1. [Lock monitoring in postgres](https://wiki.postgresql.org/wiki/Lock_Monitoring)
2. How to avoid Deadlock in a DB Transaction ?
   - All transaction should always acquire lock in a consistent manner.
   - For example in this project always acquire lock for smaller accountId.
3. [4 standard Transaction isolation levels](https://www.postgresql.org/docs/current/transaction-iso.html)
4. [Demo of standard isolation levels](https://www.youtube.com/watch?v=4EajrPgJAk0&list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE&index=10)
5. [viper repo](https://github.com/spf13/viper)
6. [validator package in go](https://github.com/go-playground/validator)
7. [Platform Agnostic Security Tokens(PASETO)](https://paseto.io/)
   - PASETO (Platform-Agnostic Security Tokens) is an open-source token format for securing web applications, similar to JOSE (JWS, JWE, and JWT) token formats.
   - However, PASETO is designed with a few key differences that offer several advantages over JOSE.

## symmetric and asymmetric JWT signing algorithms:

1. **Symmetric JWT Signing:**

   - **Key Type:** Uses a single shared secret key for both signing and verification.
   - **Operation:** The same secret key is used by both the sender (issuer) to sign the JWT and the receiver (verifier) to verify the signature.
   - **Example Algorithm:** HS256 (HMAC SHA-256) is a widely used symmetric JWT signing algorithm.

2. **Asymmetric JWT Signing:**
   - **Key Pair:** Utilizes a pair of public and private keys.
   - **Operation:** The sender uses a private key to sign the JWT, and the receiver uses the corresponding public key to verify the signature.
   - **Advantages:** Enables secure communication without the need for sharing a secret key. It provides stronger security but is computationally more intensive.
   - **Example Algorithm:** RS256 (RSA SHA-256) and ES256 (ECDSA P-256 SHA-256) are common asymmetric JWT signing algorithms.

In summary, symmetric algorithms use a single shared secret key, while asymmetric algorithms use a pair of public and private keys for JWT signing and verification. Symmetric cryptography is generally faster, while asymmetric cryptography offers enhanced security through the use of key pairs. The choice between them depends on the specific security requirements of the application.

## Problem with JWT !!

1. **Limited Session Management:**

   - Difficulty in invalidating JWTs in real-time, potentially allowing compromised tokens to remain valid until expiration.

2. **Insecure Storage:**

   - Storing JWTs in vulnerable client-side storage, like localStorage, exposes them to XSS attacks and unauthorized access.

3. **Insufficient Validation:**

   - Failure to thoroughly validate JWT claims may lead to acceptance of unauthorized or manipulated tokens.

4. **Sensitive Information Exposure:**

   - Inclusion of sensitive information in JWT payloads may expose it to interception or compromise if not handled carefully.

5. **Limited Token Revocation:**
   - Lack of built-in mechanisms for prompt and dynamic token revocation, making it challenging to invalidate compromised tokens.

## Script to wait for a service to be ready

[./wait-for](https://github.com/eficode/wait-for) is a script to wait for another service to become available.
