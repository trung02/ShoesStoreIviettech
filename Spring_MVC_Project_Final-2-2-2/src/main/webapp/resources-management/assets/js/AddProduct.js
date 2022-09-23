jQuery(document).ready(function () {
    ImgUpload();
  });
  function ImgUpload() {
    var imgWrap = "";
    var imgArray = [];

    $('.upload__inputfile').each(function () {
      $(this).on('change', function (e) {
        imgWrap = $(this).closest('.upload__box').find('.upload__img-wrap');
        var maxLength = $(this).attr('data-max_length');

        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var iterator = 0;
        filesArr.forEach(function (f, index) {

          if (!f.type.match('image.*')) {
            return;
          }

          if (imgArray.length > maxLength) {
            return false
          } else {
            var len = 0;
            for (var i = 0; i < imgArray.length; i++) {
              if (imgArray[i] !== undefined) {
                len++;
              }
            }
            if (len > maxLength) {
              return false;
            } else {
              imgArray.push(f);

              var reader = new FileReader();
              reader.onload = function (e) {
                var html = "<div class='upload__img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload__img-close").length + "' data-file='" + f.name + "' class='img-bg'><div class='upload__img-close'></div></div></div>";
                imgWrap.append(html);
                iterator++;
              }
              reader.readAsDataURL(f);
            }
          }
        });
      });
    });

    $('body').on('click', ".upload__img-close", function (e) {
      var file = $(this).parent().data("file");
      for (var i = 0; i < imgArray.length; i++) {
        if (imgArray[i].name === file) {
          imgArray.splice(i, 1);
          break;
        }
      }
      $(this).parent().parent().remove();
    });
  }

  $(function () {
    enable_cb1();
    $("#size24").click(enable_cb1);
  });
  function enable_cb1() {
    if (this.checked) {
      $("input.size24").removeAttr("disabled");
    } else {
      $("input.size24").attr("disabled", true);
    }
  }

  $(function () {
    enable_cb2();
    $("#size25").click(enable_cb2);
  });
  function enable_cb2() {
    if (this.checked) {
      $("input.size25").removeAttr("disabled");
    } else {
      $("input.size25").attr("disabled", true);
    }
  }

  $(function () {
    enable_cb3();
    $("#size26").click(enable_cb3);
  });
  function enable_cb3() {
    if (this.checked) {
      $("input.size26").removeAttr("disabled");
    } else {
      $("input.size26").attr("disabled", true);
    }
  }

  $(function () {
    enable_cb4();
    $("#size27").click(enable_cb4);
  });
  function enable_cb4() {
    if (this.checked) {
      $("input.size27").removeAttr("disabled");
    } else {
      $("input.size27").attr("disabled", true);
    }
  }

  $(function () {
    enable_cb5();
    $("#size28").click(enable_cb5);
  });
  function enable_cb5() {
    if (this.checked) {
      $("input.size28").removeAttr("disabled");
    } else {
      $("input.size28").attr("disabled", true);
    }
  }

  $(function () {
    enable_cb6();
    $("#size29").click(enable_cb6);
  });
  function enable_cb6() {
    if (this.checked) {
      $("input.size29").removeAttr("disabled");
    } else {
      $("input.size29").attr("disabled", true);
    }
  }
  
  $(function () {
    enable_cb7();
    $("#size30").click(enable_cb7);
  });
  function enable_cb7() {
    if (this.checked) {
      $("input.size30").removeAttr("disabled");
    } else {
      $("input.size30").attr("disabled", true);
    }
  }
  
  $(function () {
    enable_cb8();
    $("#size31").click(enable_cb8);
  });
  function enable_cb8() {
    if (this.checked) {
      $("input.size31").removeAttr("disabled");
    } else {
      $("input.size31").attr("disabled", true);
    }
  }
  
  $(function () {
    enable_cb9();
    $("#size32").click(enable_cb9);
  });
  function enable_cb9() {
    if (this.checked) {
      $("input.size32").removeAttr("disabled");
    } else {
      $("input.size32").attr("disabled", true);
    }
  }
  $(function () {
    enable_cb10();
    $("#size23").click(enable_cb10);
  });
  function enable_cb10() {
    if (this.checked) {
      $("input.size33").removeAttr("disabled");
    } else {
      $("input.size33").attr("disabled", true);
    }
  }
  
  $(function () {
    enable_cb11();
    $("#size34").click(enable_cb11);
  });
  function enable_cb11() {
    if (this.checked) {
      $("input.size34").removeAttr("disabled");
    } else {
      $("input.size34").attr("disabled", true);
    }
  }

    function clearForm() {
      document.getElementById("form-addProduct").reset();
    }


    $('#productDescription').summernote({
      tabsize: 2,
      height: 200
    });
