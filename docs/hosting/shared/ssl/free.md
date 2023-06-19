# Free SSL Certificates

All of our shared hosting plans include free SSL certificates. You can generate and install free SSL certificates for your domains. You can also install SSL certificates that you have purchased from a certificate authority. Our free SSL certificates are issued by [Let's Encrypt](https://letsencrypt.org). Let's Encrypt is a free, automated, and open certificate authority. Let's Encrypt certificates are trusted by all major browsers and operating systems.

!!! note "Troubleshooting/Issues"
    If you are having issues with free Let's Encrypt certificates, jump down to our [Troubleshooting](#troubleshooting) section.

## How to generate and install a free SSL certificate

When you create a subdomain or addon domain, a free SSL certificate will be generated and installed automatically. If you need to generate a SSL certificate for an external service, you can add it to cPanel and then download the certificate and private key. You can then install the certificate and private key elsewhere.

!!! warning "Let's Encrypt certificates are valid for 90 days"
    Let's Encrypt certificates are valid for 90 days. This is because Let's Encrypt was designed around the idea of short-lived certificates that are renewed automatically. Let's Encrypt certificates are renewed automatically by cPanel. You do not need to do anything to renew your Let's Encrypt certificates. **It is not recommended to export and import Let's Encrypt certificates.** If you need to install a Let's Encrypt certificate on another server, you should generate a new certificate on that server or use a service like [Certbot](https://certbot.eff.org) to generate a certificate which can be renewed automatically.

## Wildcard SSL Certificates

Let's Encrypt does offer wildcard certificates and they can be installed. Typically, cPanel will generate a wildcard certificate and cover as many sub-domains and domains as possible to reduce the number of certificates that need to be generated. If you add a subdomain or domain, a separate certificate will typically be generated until the next automated renewal process.

## What is the difference between a free SSL certificate and a paid SSL certificate?

There are several key differences and you should decide which type of certificate is best for your needs. We offer free SSL primarily to ensure a baseline security for all of our customers. If you need a higher level of security, you should purchase a paid SSL certificate.

### Insurance

Free SSL certificates do not include any amount of insurance in the event of a SSL compromise. Paid SSLs do include some amount of insurance for SSL compromise.

!!! note
    "SSL compromise" means if the CA was hacked or a flaw was discovered in their issuance process and you faced some amount of damage caused by the compromise. Like most insurance, it's not paid out if you're at fault. If you mis-configure the web server or improperly store the private key, then that is not "SSL compromise" and the insurance would not be paid out.

### Validation Types

Another difference between free SSL certificates and paid certificates are the validation types. Free certs only have **Domain Validated (DV)** certificates. This means that a certificate is issued only when the domain is validated to be under your control (e.g. setting a DNS record on your authoritative name servers, uploading a file to your web accessible directory, or sometimes by sending an email to the WHOIS contact though this is not as common due to WHOIS privacy). Paid SSLs also offer DV certs and these are issued very quickly - once the domain is validated. The difference between free SSL certificates and paid DV SSL certificates is the warranty and extra features such as dynamic site seals (graphics that validate the certificate automatically and show and image on your website).

Example site seals:

![SSL Site Seals](images/ssl-seals.png)

Paid SSL certificates also offer **Organization Validated (OV)** and **Extended Validation (EV)** certificates. These certificates require additional validation steps to ensure that the organization is legitimate and the certificate is issued to the correct organization. These certificates also include a higher warranty and additional features such as dynamic site seals.

| Validation Type | Warranty | Site Seal | Issuance Time |
| --------------- | -------- | --------- | ------------- |
| DV (Free)       | None     | Static    | Minutes       |
| DV              | $10,000  | Dynamic   | Minutes       |
| OV              | $1,250,000 | Dynamic | 1-3 Days      |
| EV              | $1,750,000 | Dynamic | 1-7 Days      |

!!! note
    Warranty values represented here are for example purposes only. Actual warranty values may vary.

# Troubleshooting

## I am using a .nodespacesites.com subdomain for my site and SSL isn't working

**Problem:** You have a website hosted on a nodespacesites.com subdomain (example.nodespacesites.com) and you receive a SSL certificate error when you attempt to use HTTPS and the certificate is self-signed by the cPanel web server.

**Solution:** The resolution is to go to cPanel and open the Zone Editor. Once in the zone editor, create a new CAA record with your subdomain (example.nodespacesites.com.) and allow certificates to be issued by letsencrypt.org. This will allow the cPanel web server to issue a Let's Encrypt certificate for your subdomain.

