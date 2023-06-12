export default function getCookie(cname) {
  return document.cookie.split(";").map(x => x.split("=").map(y => y.trim())).find(x => x[0] == cname)[1]
}
