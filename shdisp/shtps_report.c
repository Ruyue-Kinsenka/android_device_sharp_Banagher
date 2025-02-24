#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <errno.h>

#define DRM_COMMAND_BASE 0x40
#define DRM_CHANGE_BASE_FPS_LOW 0x57
#define IOCTL_DATA _IOWR(DRM_COMMAND_BASE, DRM_CHANGE_BASE_FPS_LOW, int)
#define TPSDEV_SET_VEILVIEW_STATE _IOW ( TPS_IOC_MAGIC, 46, int)
#define TPSDEV_SET_HIGH_REPORT_MODE _IOW ( TPS_IOC_MAGIC, 71, int)
#define TPS_IOC_MAGIC 0xE0

int main(int argc, char *argv[]) {
    if (argc != 2) {
        return -1;
    }

    int cmd = atoi(argv[1]);

    int fd = open("/dev/shtpsif", O_RDWR);
    if (fd < 0) {
        printf("Not found path");
        perror("open:Not found");
        return -1;
    }

    if (cmd==1) {
        if (ioctl(fd, TPSDEV_SET_HIGH_REPORT_MODE, 1) < 0) { 
        perror("Send error");
        printf("send:Send error");
        close(fd);
        return -1;
        }
    }

    if (cmd==0) {
        if (ioctl(fd, TPSDEV_SET_HIGH_REPORT_MODE, 0) < 0) { 
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
