function nav() {
  const button = document.getElementById("button")
  button.addEventListener("click",() => {
    const navbarSupportedContent = document.getElementById("navbarSupportedContent")
    if (navbarSupportedContent.getAttribute("style") == "display:block;") {
      navbarSupportedContent.removeAttribute("style", "display:block;")
    } else {
      navbarSupportedContent.setAttribute("style", "display:block;")
    }
  })
}
window.addEventListener("load", nav);