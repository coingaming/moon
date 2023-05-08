export default function setCookie(cname, cvalue) {
    const d = new Date();
    d.setFullYear(d.getFullYear() + 1);
    let expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
