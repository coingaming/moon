import getCookie from "./cookies/get-cookie";
import setCookie from "./cookies/set-cookie";

export default function setIsMobile() {
    let isMobile = screen.width < 1024;

    if (isMobile && getCookie("is_mobile") == "false") {
        setCookie("is_mobile", isMobile);
        location.reload();
    }
    if (!isMobile && getCookie("is_mobile") == "true") {
        setCookie("is_mobile", isMobile);
        location.reload();
    }
}
