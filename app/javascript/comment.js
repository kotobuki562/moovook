function comment() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    const showContent = document.getElementById("show-content");
    const postId = showContent.getAttribute("post-id");
    XHR.open("POST", "/posts/"+postId+"/comments", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }

      const item = XHR.response.text;
      const list = document.getElementById("list");
      const formText = document.getElementById("comment");
      const HTML = `
        <li class="comments_list" id=${item.id}>
          <span class="comment-user-name">
            ${item.user_name}
          </span>
          ${item.text}
        </li>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", comment);