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
          ${item.text}
          <span class="comment-user-name">
            <%= image_tag('man.png',size: '20x20') %>
            <%= link_to(comment.user.name, user_path(comment.user.id)) %>
            <%= image_tag('woman.png',size: '20x20') %>
          </span>
        </li>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", comment);