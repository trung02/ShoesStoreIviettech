
// ===================== import HTML to HTML JS ===================
let includes = document.getElementsByTagName('include');
for (var i = 0; i < includes.length; i++) {
  let include = includes[i];
  load_file(includes[i].attributes.src.value, function (text) {
    include.insertAdjacentHTML('afterend', text);
    include.remove();
  });
}
function load_file(filename, callback) {
  fetch(filename).then(response => response.text()).then(text => callback(text));
}

{/* <include src="./components/Header.html"></include> */}

// ======================================
$(function(){
  $("#header").load("../html/components/Header.html"); 
  $("#footer").load("../html/components/footer.html"); 
});
