# Simple keylogger demostration with XSS

Recreation of a keylogger with XSS using as a base the [Institut Montilivi's](https://www.institutmontilivi.cat/intranet/login) main HTML page to emule a more _"beauty"_ possible case scenario. Using **NGINX** to host the clone of Institut's login website, running it locally inside a **Docker** container and listening with a keyyloger in **Python** and few lines of **JavaScript**.

## How to

Just clone the repository inside a folder, check before if you have Docker installed in your machine with a simple `docker --version` (install it if you didn't have a ouput). Execute the following command to be able to run Docker without sudo:

```bash
sudo usermod -aG docker $USER && reboot
```

After that, just follow this commands:


```bash
cd kiss-keylogger-with-xss/
chmod +x run_docker.sh
./run_docker.sh

```

Follow one of the URLs that it provides you after the container creation and if everything went well now you can execute the Python code with a `python listener.py` and see in your console the keys that are being pressed inside our clone web page.
