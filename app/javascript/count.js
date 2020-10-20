function count (){

  const titleText  = document.getElementById("title-text");
  const wrapText = document.getElementById("wrap-text");
  const impressionsText = document.getElementById("impressions-text");
  const actionText = document.getElementById("action-text");

  titleText.addEventListener("keyup", () => {
    const countVal = titleText.value.length;
    const charNum  = document.getElementById("char_num_t");
    charNum.innerHTML = `${countVal}`;
  });

  wrapText.addEventListener("keyup", () => {
    const countVal = wrapText.value.length;
    const charNum  = document.getElementById("char_num_w");
    charNum.innerHTML = `${countVal}`;
  });

  impressionsText.addEventListener("keyup", () => {
    const countVal = impressionsText.value.length;
    const charNum  = document.getElementById("char_num_i");
    charNum.innerHTML = `${countVal}`;
  });

  actionText.addEventListener("keyup", () => {
    const countVal = actionText.value.length;
    const charNum  = document.getElementById("char_num_a");
    charNum.innerHTML = `${countVal}`;
  });
}

window.addEventListener('load', count);