# Setting Up SSH Server and Creating SSH Keys

## Setting Up SSH Server

1. **Install OpenSSH Server:**
    ```sh
    sudo apt update
    sudo apt install openssh-server
    ```

2. **Enable and Start SSH Service:**
    ```sh
    sudo systemctl enable ssh
    sudo systemctl start ssh
    ```

3. **Check SSH Service Status:**
    ```sh
    sudo systemctl status ssh
    ```

## Creating SSH Keys

1. **Generate SSH Key Pair:**
    ```sh
    ssh-keygen -t rsa -b 4096 -C "email@example.com"
    ```

2. **Follow the prompts:**
    - Enter file in which to save the key (press Enter to accept default location).
    - Enter passphrase (optional, but recommended).

3. **Copy Public Key to SSH Server:**
    ```sh
    ssh-copy-id username@remote_host
    ```

4. **Verify SSH Access:**
    ```sh
    ssh username@remote_host
    ```

- **Restart SSH Service:**
  ```sh
  sudo systemctl restart ssh
  ```

## Troubleshooting

- **Check SSH Logs:**
  ```sh
  sudo journalctl -u ssh
  ```

- **Test SSH Connection with Verbose Output:**
  ```sh
  ssh username@remote_host
  ```