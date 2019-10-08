/* ----------- Img preview ---------- */
function readURL(input, target) {
	if (input.files && input.files[0]) {
		var imgfiles = [];
		var files = input.files;
		var filesArr = Array.prototype.slice.call(files);
		var index = 0;

		filesArr.forEach(function (f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			imgfiles.push(f);

			var reader = new FileReader();
			reader.onload = function (e) {
				var result = "<img class='fileImg' src='" + e.target.result + "' style='width:200px; height:200px'>";
				target.append(result);
				index++;
			}
			reader.readAsDataURL(f);
		});
	}
}

/* ----------- camp (write, update) ---------- */
$(function () {
	
	/* ----------- textCount ---------- */
	$("#product_name").keyup(function (e) {
		var content = $(this).val();
		$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		$("#productNameCnt").html(content.length);
	});
	$("#product_name").keyup();

	$("#product_text").keyup(function (e) {
		var content = $(this).val();
		$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		$("#productContentCnt").html(content.length);
	});
	$("#product_text").keyup();
	
	
	/* ----------- Img preview ---------- */
	$("#writeForm1").on("change", "#titleImgFile", function (event) {
		$('.inner_img').empty();
		readURL(this, $(".inner_img"));
	});
	$("#writeForm1").on("change", "#imgFile", function (event) {
		$('.inner_imgs').empty();
		readURL(this, $(".inner_imgs"));
	});

	$("#updateForm1").on("change", "#titleImgFile", function (event) {
		$(".inner_img").empty();
	    readURL(this, $(".inner_img"));
	});
	$("#updateForm1").on("change", "#imgFile", function (event) {
	    readURL(this, $(".inner_imgs"));
	});

	//이미지 삭제
	$('.img-wrap .close').on('click', function() {
		var campFileNo = $(this).attr('data-fileNo');
		var deleteBtn = $(this).parent().parent();
		$.ajax({
			url: "/camp/delete-file",
			method: "GET",
			data: {"campFileNo" : campFileNo },
			success: function(data, status, xhr){
				deleteBtn.remove();
			},
			error: function(xhr, status, err){
				alert('삭제 실패');
			}
			
		});
	   
	});	
	
});

