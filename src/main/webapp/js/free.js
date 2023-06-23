

function free_check() {
    var fileInputs = document.getElementsByName("files");
    var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|webp)$/;
    var maxSize = 1 * 1024 * 1024;
    var maxUploads = 10;

    if($.trim($("#subject").val()) == ""){
        alert("제목을 입력하세요");
        $("#subject").val("").focus();
        return false;
    }
    if ($.trim($("#category").val()) == "") {
        alert("카테고리를 선택하세요!");
        $("#category").focus();
        return false;
    }
    if ($.trim($("#content").val()) == "") {
        alert("내용을 입력하세요!");
        $("#content").val("").focus();
        return false;
    }

    for (var i = 0; i < fileInputs.length; i++) {
        var fileInput = fileInputs[i];
        var files = fileInput.files;

        if (files.length > maxUploads) {
            alert("최대 " + maxUploads + "개의 파일만 업로드할 수 있습니다.");
            return false;
        }

        for (var j = 0; j < files.length; j++) {
            var file = files[j];

            if (!file.name.match(fileForm)) {
                alert("이미지 파일만 업로드 가능합니다.");
                return false;
            }
            if (file.size > maxSize) {
                alert("파일 사이즈는 1MB까지 가능합니다.");
                return false;
            }
        }
    }
}