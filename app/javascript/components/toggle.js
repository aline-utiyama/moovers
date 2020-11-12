const buttonToggle = () => {
  const buttons = document.querySelectorAll(".toggle-btn");
  buttons.forEach((button) => {
    button.addEventListener("click", (event) => {
      console.log(event.currentTarget);
      const id = event.currentTarget.dataset.id;
      console.log(id);
      const div = document.querySelector(`div[data-booking-id="${id}"]`);
      console.log(div);
      if (div.classList.contains("d-none")) {
        div.classList.remove("d-none");        
      } else {
        div.classList.add("d-none");
      }
    })
  }) 
 
}

export { buttonToggle };