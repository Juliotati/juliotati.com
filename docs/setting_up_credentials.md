# Codemagic Credentials Guide

This document explains where to find or generate the various environment variables required for the Codemagic CI/CD pipelines (e.g., in `codemagic.yaml`).

## Apple / App Store Connect Credentials (`appstore_credentials`)

These credentials are used for uploading iOS and macOS apps to App Store Connect and signing the builds.

### 1. `APP_STORE_CONNECT_ISSUER_ID`
* **Where to find it**: 
  1. Log in to [App Store Connect](https://appstoreconnect.apple.com/).
  2. Click on **Users and Access**.
  3. Go to the **Integrations** tab, then select **App Store Connect API** on the left menu.
  4. Near the top of the page, you'll see **Issuer ID** (it looks like a long UUID string). Copy that value.

### 2. `APP_STORE_CONNECT_KEY_IDENTIFIER` (Key ID)
* **Where to find it**: 
  1. On the same **App Store Connect API** page in App Store Connect.
  2. Look at the list of active keys (generate a new one with "App Manager" or "Admin" access if needed).
  3. In the list, you will see a column labeled **Key ID** (a short alphanumeric string like `ABCD123456`). Copy this.

### 3. `APP_STORE_CONNECT_PRIVATE_KEY`
* **Where to find it**: 
  1. When you generate a new API key from the step above, you are given a one-time option to **Download API Key**.
  2. Download this file (it ends in `.p8`).
  3. Open the `.p8` file in a text editor.
  4. Copy the entire contents of the file, including the `-----BEGIN PRIVATE KEY-----` and `-----END PRIVATE KEY-----` header and footer lines.

### 4. `CERTIFICATE_PRIVATE_KEY`
* **Where to find it**: 
  This comes from the Mac where you originally created your Apple Distribution/Development certificates (in Keychain Access).
  1. Open **Keychain Access** on your Mac.
  2. Go to **login** > **Certificates**.
  3. Find your Apple Distribution certificate (e.g., `Apple Distribution: Julio Tati...`).
  4. Click the arrow `>` next to it to reveal the private key underneath.
  5. Right-click the private key and select **Export**.
  6. Export it as a `.p12` file.
  7. Convert this `.p12` file to an RSA private key format using Terminal:
     ```bash
     openssl pkcs12 -in yourfile.p12 -nodes -nocerts -out private_key.pem
     ```
  8. Copy the contents of the `private_key.pem` file.
  *Note: If you use Codemagic's automatic code signing integration UI, you may not need to provide this manually.*

#### Troubleshooting `CERTIFICATE_PRIVATE_KEY`

**1. What if my certificate is expired?**
If you see a red 'X' next to your certificate in Keychain Access because it's expired:
1. In Keychain Access, go to **Certificate Assistant > Request a Certificate from a Certificate Authority...**
2. Enter your email, choose **Saved to disk**, and save the `.certSigningRequest` file to your desktop.
3. Go to [Apple Developer Certificates](https://developer.apple.com/account/resources/certificates/list) and click **+** to generate a new Apple Distribution certificate.
4. Upload your `.certSigningRequest` and download the resulting `.cer` file.
5. Double-click the `.cer` file to install it into Keychain Access, then follow the export steps above.

**2. OpenSSL Error: "unsupported:crypto/evp/evp_fetch.c... Algorithm (RC2-40-CBC)"**
Newer versions of OpenSSL (v3+) block the legacy encryption algorithm macOS uses for `.p12` files. To fix this, append the `-legacy` flag to your command:
```bash
openssl pkcs12 -in yourfile.p12 -nodes -nocerts -out private_key.pem -legacy
```
*(If `-legacy` alone doesn't work, try `-provider legacy -provider default` instead).*

---

## Google Cloud Credentials (`google_credential`)

These credentials are used for Android publishing to Google Play Console. The value should be the contents of a JSON key file from a Google Cloud Service Account that has access to your Google Play Console.

### `GCLOUD_SERVICE_ACCOUNT_CREDENTIAL`
* **How to generate it:**
  1. Go to the [Google Cloud Console](https://console.cloud.google.com/) and select or create a project for your app.
  2. Navigate to **IAM & Admin > Service Accounts**.
  3. Click **Create Service Account**. Give it a name (e.g., `codemagic-play-console`) and click **Create and Continue**.
  4. Skip the optional roles and click **Done**.
  5. Back in the list of service accounts, copy the **Email address** of your new service account.
  6. Click the **three dots** (Actions) next to your new service account and select **Manage keys**.
  7. Click **Add Key > Create new key**, select **JSON**, and click **Create**. The `.json` file will download to your computer.
  8. Now, go to the [Google Play Console](https://play.google.com/console/) and select your developer account.
  9. Go to **[Users and permissions](https://play.google.com/console/developers/users-and-permissions)** and click **Invite new users**.
  10. **Crucial Step**: Paste the **Service Account Email** you copied in Step 5. Go to the **Account permissions** tab, grant it the **Admin** or **Release manager** permissions, and click **Invite user**.

* **How to add it to Codemagic**:
  Open the downloaded `.json` file in a text editor. Copy the entire contents of the file and paste it into the `GCLOUD_SERVICE_ACCOUNT_CREDENTIAL` variable in Codemagic.
