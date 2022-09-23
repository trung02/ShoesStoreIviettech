{
  const tabList = document.querySelector(".tab-list");
  const tabItems = tabList.querySelectorAll(".tab-item");
  tabItems.forEach((_) => _.addEventListener("click", handleTabChange));
  function handleTabChange(e) {
    if (e.target.classList.contains("active")) return;
    tabItems.forEach((_) => _.classList.remove("active"));
    e.target.classList.add("active");
  }
}
