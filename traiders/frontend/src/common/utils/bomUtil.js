/* eslint-disable */
export default class BomUtil {
  static scrollToTop() {
    window.scrollTo(0, 0);
  }

  static getWindowInnerHeight() {
    return window.innerHeight;
  }

  static getRelativePath(path) {
    return window.location.pathname.replace('', '').replace(/\/+$/, '') + path;
  }
}
