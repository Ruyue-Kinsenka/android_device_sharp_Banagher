#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <errno.h>

#define DRM_IOCTL_BASE			'd'
#define DRM_IOWR(nr,type) _IOWR(DRM_IOCTL_BASE,nr,type)
#define DRM_COMMAND_BASE      0x40
#define DRM_CHANGE_BASE_FPS_LOW 0x57
#define DRM_IOCTL_CHANGE_BASE_FPS_LOW DRM_IOWR((DRM_COMMAND_BASE + \
			DRM_CHANGE_BASE_FPS_LOW), int)

int main(int argc, char *argv[]) {
    if (argc != 2) {
        return -1;
    }

    int fps = atoi(argv[1]);

    int fd = open("/dev/dri/card0", O_RDWR);
    if (fd < 0) {
        printf("Not found path");
        perror("open:Not found");
        return -1;
    }

    if (fps == 30){
        if (ioctl(fd, DRM_IOCTL_CHANGE_BASE_FPS_LOW, 30) < 0) { 
        perror("Send error");
        printf("send:Send error");
        close(fd);
        return -1;
        }
    }

    if (fps == 60){
        if (ioctl(fd, DRM_IOCTL_CHANGE_BASE_FPS_LOW, 60) < 0) { 
        perror("Send error");
        printf("send:Send error");
        close(fd);
        return -1;
        }
    }

    if (fps == 120){
        if (ioctl(fd, DRM_IOCTL_CHANGE_BASE_FPS_LOW, 120) < 0) { 
        perror("Send error");
        printf("send:Send error");
        close(fd);
        return -1;
        }
    }

    if (fps == 100){
        if (ioctl(fd, DRM_IOCTL_CHANGE_BASE_FPS_LOW, 100) < 0) { 
        perror("Send error");
        printf("send:Send error");
        close(fd);
        return -1;
        }
    }

    printf("Successful");
    close(fd);
    return 0;
}
