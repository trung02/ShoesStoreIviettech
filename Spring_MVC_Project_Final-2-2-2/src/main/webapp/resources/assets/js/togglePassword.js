{
  const eyeIcons = document.querySelectorAll(".form-group.password i");
  eyeIcons.forEach((_) => _.addEventListener("click", toggleInput));
  function toggleInput(e) {
    e.stopPropagation();
    console.log(e.target);
    if (e.target.classList.contains("fa-eye")) {
      e.target.classList.remove("fa-eye");
      e.target.classList.add("fa-eye-slash");
      e.target.previousElementSibling.type = "text";
    } else {
      e.target.classList.add("fa-eye");
      e.target.classList.remove("fa-eye-slash");
      e.target.previousElementSibling.type = "password";
    }
  }
}
