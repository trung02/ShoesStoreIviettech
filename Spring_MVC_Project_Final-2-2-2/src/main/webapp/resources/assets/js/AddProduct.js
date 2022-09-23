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
    $("#sizexs").click(enable_cb1);
  });
  function enable_cb1() {
    if (this.checked) {
      $("input.sizexs").removeAttr("disabled");
    } else {
      $("input.sizexs").attr("disabled", true);
    }
  }

  $(function () {
    enable_cb2();
    $("#sizes").click(enable_cb2);
  });
  function enable_cb2() {
    if (this.checked) {
      $("input.sizes").removeAttr("disabled");
    } else {
      $("input.sizes").attr("disabled", true);
    }
  }

  $(function () {
    enable_cb3();
    $("#sizem").click(enable_cb3);
  });
  function enable_cb3() {
    if (this.checked) {
      $("input.sizem").removeAttr("disabled");
    } else {
      $("input.sizem").attr("disabled", true);
    }
  }

  $(function () {
    enable_cb4();
    $("#sizel").click(enable_cb4);
  });
  function enable_cb4() {
    if (this.checked) {
      $("input.sizel").removeAttr("disabled");
    } else {
      $("input.sizel").attr("disabled", true);
    }
  }

  $(function () {
    enable_cb5();
    $("#sizexl").click(enable_cb5);
  });
  function enable_cb5() {
    if (this.checked) {
      $("input.sizexl").removeAttr("disabled");
    } else {
      $("input.sizexl").attr("disabled", true);
    }
  }

  $(function () {
    enable_cb6();
    $("#sizexxl").click(enable_cb6);
  });
  function enable_cb6() {
    if (this.checked) {
      $("input.sizexxl").removeAttr("disabled");
    } else {
      $("input.sizexxl").attr("disabled", true);
    }
  }

    function clearForm() {
      document.getElementById("form-addProduct").reset();
    }


    $('#productDescription').summernote({
      tabsize: 2,
      height: 200
    });
