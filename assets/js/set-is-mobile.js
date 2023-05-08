import getCookie from "./cookies/get-cookie";
import setCookie from "./cookies/set-cookie";

export default function setIsMobile() {
    let isMobile = ('ontouchstart' in document.documentElement);

    if (isMobile && getCookie("is_mobile") == "false") {
        setCookie("is_mobile", isMobile);
        location.reload();
    }
}
