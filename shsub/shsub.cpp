#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/strings.h>
#include "shsub.h"

using android::base::WriteStringToFile;

namespace {
const std::string USB_GADGET_PATH = "/config/usb_gadget/g1/";

struct UsbConfig {
    std::string idVendor;
    std::string idProduct;
    std::vector<std::string> functions;
    bool enableAdb;
};

const std::map<std::string, UsbConfig> kUsbConfigMap = {
    {"mtp", {"0x18d1", "0x4ee1", {"mtp"}, false}},
    {"mtp,adb", {"0x18d1", "0x4ee2", {"mtp", "adb"}, true}},
    {"rndis", {"0x18d1", "0x4ee3", {"rndis"}, false}},
    {"rndis,adb", {"0x18d1", "0x4ee4", {"rndis", "adb"}, true}},
    {"mass_storage", {"0x18d1", "0x4ee5", {"mass_storage"}, false}},
    {"mass_storage,adb", {"0x18d1", "0x4ee6", {"mass_storage", "adb"}, true}},
    {"ptp", {"0x18d1", "0x4ee7", {"ptp"}, false}},
    {"ptp,adb", {"0x18d1", "0x4ee8", {"ptp", "adb"}, true}},
};

bool WriteConfig(const std::string& path, const std::string& value) {
    if (!WriteStringToFile(value, path)) {
        LOG(ERROR) << "Failed to write " << value << " to " << path;
        return false;
    }
    return true;
}

bool ConfigureUsbGadget(const UsbConfig& config) {
    if (!WriteConfig(USB_GADGET_PATH + "idVendor", config.idVendor) ||
        !WriteConfig(USB_GADGET_PATH + "idProduct", config.idProduct)) {
        return false;
    }

    std::string functions = android::base::Join(config.functions, ",");
    if (!WriteConfig(USB_GADGET_PATH + "functions", functions)) {
        return false;
    }

    if (config.enableAdb) {
        if (!WriteConfig(USB_GADGET_PATH + "enable", "1")) {
            return false;
        }
    }
    return true;
}

}  // namespace

void SetUsbConfig(const std::string& config) {
    auto it = kUsbConfigMap.find(config);
    if (it == kUsbConfigMap.end()) {
        LOG(ERROR) << "Unsupported USB config: " << config;
        return;
    }

    if (!ConfigureUsbGadget(it->second)) {
        LOG(ERROR) << "Failed to configure USB gadget for " << config;
    } else {
        LOG(INFO) << "Successfully configured USB gadget for " << config;
    }
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        LOG(ERROR) << "Usage: " << argv[0] << " <usb_config>";
        return 1;
    }

    std::string config = argv[1];
    SetUsbConfig(config);
    return 0;
}
