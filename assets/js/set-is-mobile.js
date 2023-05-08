import getCookie from "./cookies/get-cookie";
import setCookie from "./cookies/set-cookie";

export default function setIsMobile() {
    let screenWidth = window.innerWidth
        || document.documentElement.clientWidth
        || document.body.clientWidth
        || 0;

    let isMobile = screenWidth < 1024;
    let cookieIsMobile = getCookie("is_mobile") != "false";

    console.log({ isMobile })
    console.log({ cookieIsMobile })

    if (isMobile != cookieIsMobile) {
        setCookie("is_mobile", isMobile);
        location.reload();
    }
}
