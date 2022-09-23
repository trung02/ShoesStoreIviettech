
{
  let stickyCheckout = document.querySelector(".sticky--checkout");
  window.addEventListener("scroll", toggleSticky);
  function toggleSticky() {
    let bot =
      (window.pageYOffset || document.documentElement.scrollTop) + window.innerHeight;
    if (bot > window.innerHeight + 500) {
      stickyCheckout.style.transform = "translateY(" + 0 + "%)";
    } else {
      stickyCheckout.style.transform = "translateY(" + 100 + "%)";
    }
  }
}
{
  let currentPos = 0;
  const negativeHundred = -100;
  let inlineSlide = 6;

  const sliderLeftContainer = document.querySelector(".slider__product-img-list--left");
    //const sliderLeft = sliderLeftContainer.querySelector(".slider__product-img-wrapper");
  const sliderRightContainer = document.querySelector(".slider__product-img-list--right");
  const sliderRight = sliderRightContainer.querySelector(".slider__product-img-wrapper");
  const sliderLeftImages = Array.from(sliderLeftContainer.querySelectorAll("img"));
  const sliderRightImages = sliderRightContainer.querySelectorAll("img");
  const back = sliderRightContainer.querySelector(".back");
  const next = sliderRightContainer.querySelector(".next");
  back.addEventListener("click", backToPreviousPage);
  back.querySelector("i").addEventListener("click", backToPreviousPage);
  next.addEventListener("click", moveToNextPage);
  next.querySelector("i").addEventListener("click", moveToNextPage);

  let sliderLength = sliderRightImages.length;
  function backToPreviousPage(e) {
    --currentPos;
    currentPos = currentPos > 0 ? Math.abs(currentPos) % sliderLength : 0;
    e.stopPropagation();
    sliderRightAnimation();
    activeIndex(currentPos);
  }
  function moveToNextPage(e) {
    currentPos = Math.abs(++currentPos) % sliderLength;
    e.stopPropagation();
    sliderRightAnimation();
    activeIndex(currentPos);
  }
  function activeIndex(index) {
    sliderLeftImages.forEach((_) => _.classList.remove("active"));
    sliderLeftImages[index].classList.add("active");
  }

  sliderLeftImages.forEach((_) => _.addEventListener("click", moveToPage));
  function moveToPage(e) {
    currentPos = sliderLeftImages.indexOf(e.target);
    console.log(sliderLeftImages.indexOf(e.target));
    sliderRightAnimation();
    activeIndex(currentPos);
  }
  function sliderRightAnimation() {
    sliderRight.style.transform = "translateX(" + currentPos * negativeHundred + "%)";
  }
}
