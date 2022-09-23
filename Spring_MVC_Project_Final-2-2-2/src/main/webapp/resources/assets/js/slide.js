/** @format */

import Swiper from "https://unpkg.com/swiper@8/swiper-bundle.esm.browser.min.js";
let swiper = new Swiper(".swiper-container.two", {
  pagination: {
    el: ".swiper-pagination",
    type: "bullets",
    clickable: true,
    //change text for each slide
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  paginationClickable: true,
  effect: "coverflow",
  loop: true,
  centeredSlides: true,
  slidesPerView: "2",
  coverflow: {
    rotate: 0,
    stretch: 100,
    depth: 150,
    modifier: 1.5,
    slideShadows: false,
  },
  autoplay: {
    delay: 2000,
  },
});

new Swiper(".three", {
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  slidesPerView: 3,
});

const slide_bottom = document.querySelector(".slide-bottom");
const [...items] = document.querySelectorAll(".slide-bottom-item");
const btn_next = document.querySelector(".btn-next");
const btn_pre = document.querySelector(".btn-pre");
const dotparent = document.querySelector(".dots");
let i = 0;
//click next slide_bottom
btn_next.addEventListener("click", e => {
  e.preventDefault();
  // transform style
  i++;
  if (i >= items.length - 1) {
    i = 0;
    slide_bottom.style.transform = `translateX(0%)`;
  }
  slide_bottom.style.transform = `translateX(calc(${i * -15}% - ${15 * i}px))`;
  //remove active class
  items.forEach(item => item.classList.remove("active"));
  //add active class
  items[i + 1].classList.add("active");
  //dot active
  const dots = document.querySelectorAll(".dot");
  //remove active dots
  dots.forEach(dot => dot.classList.remove("active"));
  dots[i].classList.add("active");
});

btn_pre.addEventListener("click", e => {
  e.preventDefault();
  // transform style
  i--;
  if (i === -1) {
    i = 0;
    slide_bottom.style.transform = `translateX(0%)`;
  }
  slide_bottom.style.transform = `translateX(calc(${i * -15}% - ${15 * i}px))`;
  //remove active class
  items.forEach(item => item.classList.remove("active"));
  //add active class
  items[i + 1].classList.add("active");
  //dot active
  const dots = document.querySelectorAll(".dot");
  //remove active dots
  dots.forEach(dot => dot.classList.remove("active"));
  dots[i].classList.add("active");
});

//reder dots
dotparent.innerHTML = items
  .map((item, index) => {
    return `<div class="dot" data-index="${index}"></div>`;
  })
  .join("");

//dot active
const dots = document.querySelectorAll(".dot");
//remove active dots
dots.forEach(dot => dot.classList.remove("active"));
if (i === 0) {
  dots[0].classList.add("active");
} else {
  dots[i].classList.add("active");
}
