# docker-arch-mirroring

Run as root ```bash install.sh```<br>
enter your domain name (or localhost for local).<br>
Edit the install.sh for change port (default 80) .<br>
If dont lunch the container with the install.sh run: 

    docker run -d --restart always -p 80:80 arch-mirroring
    
 Default sync every hour at x:46 (change it in The dockerfile).<br>
 Default mirror locate in france. (Change it in arch_sync.sh).<br>
 
 No https yet..
 
 Then add ```Server = arch.[Your domain name]/$repo/os/$arch``` in the top of your ```/etc/pacman.d/mirrorlist```
