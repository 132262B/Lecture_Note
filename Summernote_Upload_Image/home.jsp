<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 예제</title>
	<!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function() {
    	
    	var toolbar = [
    		    // 글꼴 설정
    		    ['fontname', ['fontname']],
    		    // 글자 크기 설정
    		    ['fontsize', ['fontsize']],
    		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    		    // 글자색
    		    ['color', ['forecolor','color']],
    		    // 표만들기
    		    ['table', ['table']],
    		    // 글머리 기호, 번호매기기, 문단정렬
    		    ['para', ['ul', 'ol', 'paragraph']],
    		    // 줄간격
    		    ['height', ['height']],
    		    // 그림첨부, 링크만들기, 동영상첨부
    		    ['insert',['picture','link','video']],
    		    // 코드보기, 확대해서보기, 도움말
    		    ['view', ['codeview' ,'fullscreen', 'help']]
    		  ];

    	var setting = {
                height : 500,  // 기존 높이값
                minHeight : 300, // 최소 높이값
                focus : true,  // 페이지에 방문하였을때 포커스가 되있는지 안되있는지
                toolbar : toolbar,  // 어떤 툴바를 사용할껀지, 위 내용 참고
                callbacks : { //여기 부분이 이미지를 첨부하는 부분
                onImageUpload :  // 이미지 업로드 시작
                	function(files, editor, welEditable) {
    		            for (var i = files.length - 1; i >= 0; i--) {
    		            uploadImageFile(files[i],this);
    		            	}
    		            }
    		          }
    		        };
			// 어디에 summernote를 불러올껀지
            $('#summernoteContent').summernote(setting);
            });
    
    function uploadImageFile(file, el) {
		data = new FormData();
		data.append("file",file);
		const directory = "productInfo";
		
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadImage",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
}
    </script>
</head>
<body>
	<h1>이미지 업로드 예제</h1>
	<!-- 여기에 summernote 결과를 뿌려줍니다. -->
	<div id="summernoteContent">
	
	</div>
</body>
</html>