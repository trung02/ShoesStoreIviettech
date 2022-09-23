function formatPrice(num) {
  return num.toLocaleString("vi-VN", { style: "currency", currency: "VND" });
}
