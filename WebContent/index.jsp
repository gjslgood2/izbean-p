<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Web Programming Assignment</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	
	getPosts();
});

function allCheck(a) {
	var checkbox = $('table tbody input[type="checkbox"]');
	if(a.checked){
		checkbox.each(function(){
			a.checked = true;                        
		});
	} else{
		checkbox.each(function(){
			a.checked = false;                        
		});
	} 
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
}

function addPost() {
	 $.ajax({
	        type:"POST",
	        url:"/INPProject/insert.do",
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        data: $(document.addedForm).serialize(),
	        datatype:"json",
	        success: function(data) {
	          alert("게시글이 등록 완료되었어요.");
	          $(document.addedForm)[0].reset();
	          $('#addEmployeeModal').modal('hide');
	          getPosts();
	        },
	        error: function(e, e2, e3) {
	          alert("에러발생");
	        }			
	  });
}

function getPosts() {
	$.ajax({
        type:"POST",
        url:"/INPProject/select.bh",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        datatype:"json",
        success: function(data) {
        	tableCreate(data["response"])
        }
  	});
}

function tableCreate(data) {
	$('#tbody tbody').html("");
	
	for ( var i=0; data.length > i; i++) {
		var $tr = $('<tr/>');
		var $checkBoxTd = $('<td/>').css('cursor', 'pointer');
		var $span = $('<span/>').addClass('custom-checkbox');
		var $spanInput = $('<input/>').attr({
			"type" : "checkbox",
			"id" : "checkbox" + i,
			"name" : "options[]",
			"value" : data[i]["ID"]
		});
		var $spanLabel = $('<label/>').attr('for', "checkbox" + i);
		
		$checkBoxTd.append($span.append($spanInput).append($spanLabel));
		
		var $title = $('<td/>').attr({
			"onclick" : "viewClick(this)"
		}).css('cursor', 'pointer').text(data[i]["TITLE"]);
		var $regid = $('<td/>').attr({
			"onclick" : "viewClick(this)"
		}).css('cursor', 'pointer').text(data[i]["REG_ID"]);
		var $regdt = $('<td/>').attr({
			"onclick" : "viewClick(this)"
		}).css('cursor', 'pointer').text(data[i]["REG_DT"]);	
		var $btn = $('<td/>');
		var $btnA = $('<a/>').attr({
			"onclick" : "modiClick(this)",
			"class": "edit",
			"data-toggle": "modal"
		}).css('cursor', 'pointer');
		
		var $btnAI = $('<i/>').attr({
			"class": "material-icons",
			"data-toggle": "tooltip",
			"title": "edit"
		}).text("");
		
		var $btnB = $('<a/>').attr({
			"onclick" : "delClick(this)",
			"class": "delete",
			"data-toggle": "modal"
		}).css('cursor', 'pointer');
		
		var $btnBI = $('<i/>').attr({
			"class": "material-icons",
			"data-toggle": "tooltip",
			"title": "Delete"
		}).text("");
		
		$btn.append($btnA.append($btnAI)).append($btnB.append($btnBI));
		
		$tr.append($checkBoxTd).append($title).append($regid).append($regdt).append($btn);
		
		$('#tbody tbody').append($tr);
	}
}

var delId = "";
var modiId = "";

function delClick(a) {
	$('#deleteEmployeeModal').modal('show');
	delId = $(a).parents('tr').find('input[type=checkbox]').val();
}

function delOk(a) {
	
	if ( a == "A") {
		var gSize = "";
		$("input[type=checkbox]:checked").each(function() {
			if(gSize == ""){
				gSize = $(this).val();
			} else {
				gSize = gSize + "," + $(this).val();
			}
		});
		
		$.ajax({
	        type:"POST",
	        data : {"ID" : gSize },
	        url:"/INPProject/delete.do",
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        datatype:"json",
	        success: function(result) {
	        	alert("선택한 게시글이 삭제 완료되었어요.");
	        	$('#deleteEmployeeModal').modal('hide');
	        	getPosts();
	        }
	      });
	} else {
		$.ajax({
	        type:"POST",
	        data : {"ID" : delId },
	        url:"/INPProject/delete.do",
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        datatype:"json",
	        success: function(result) {
	        	alert("게시글이 삭제 완료되었어요.");
	        	$('#deleteEmployeeModal').modal('hide');
	        	getPosts();
	        }
	      });
	}
}

function delClose() {
	delId = "";
	$('#deleteEmployeeModal').modal('hide');
	
}

function viewClick(a) {
	$('#viewEmployeeModal').modal('show');
	$.ajax({
        type:"POST",
        data : {"ID" : $(a).parents('tr').find('input[type=checkbox]').val() },
        url:"/INPProject/detail.do",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        datatype:"json",
        success: function(result) {
        	for ( key in result["response"] ) {
        		$('form[name=viewForm]').find('[id='+ key +']').text(result[key]);
        	}
        }
      });
}

function modiClick(a) {
	$('#editEmployeeModal').modal('show');
	modiId = $(a).parents('tr').find('input[type=checkbox]').val();
	
	$.ajax({
        type:"POST",
        data : {"ID" : modiId },
        url:"/INPProject/detail.do",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        datatype:"json",
        success: function(result) {
        	for ( key in result ) {
        		$('form[name=modifyForm]').find('[name='+ key +']').val(result[key]);
        	}
        }
      });
}

function modiClose() {
	modiId = "";
	$('#editEmployeeModal').modal('hide');
}

function modiOk() {
	$.ajax({
        type:"POST",
        data : $(document.modifyForm).serialize(),
        url:"/INPProject/update.do",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        datatype:"json",
        success: function(result) {
        	alert("게시글이 수정 완료되었어요.");
        	$('#editEmployeeModal').modal('hide');
        	getPosts();
        }
      });
}
</script>
</head>
<body>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>Simple Board</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>글 작성</span></a>
						<a href="#deleteEmployeeModal" onclick="delOk('A')" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>선택 글 삭제</span></a>
					</div>
                </div>
            </div>
            <table class="table table-striped table-hover" id="tbody">
            	<colgroup>
            		<col width="10%">
            		<col width="40%">
            		<col width="25%">
            		<col width="25%">
            	</colgroup>
                <thead>
                    <tr>
						<th>
							<span class="custom-checkbox">
<!-- 								<input type="checkbox" id="selectAll" onclick="allCheck(this)"> -->
<!-- 								<label for="selectAll"></label> -->
							</span>
						</th>
                        <th>제목</th>
                        <th>작성자</th>
						<th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
    </div>
	<!-- Edit Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form name="addedForm" onsubmit="return false;">
					<div class="modal-header">						
						<h4 class="modal-title">글 작성</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>제목</label>
							<input type="text" class="form-control" name="TITLE" required>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="10" name="NOTE" required></textarea>
						</div>
						<div class="form-group">
							<label>작성자</label>
							<input type="text" class="form-control" size="5" name="REG_ID" value="강병헌" readonly="readonly" required />
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="닫기">
						<input type="button" class="btn btn-success" value="추가" onclick="addPost()">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form name="modifyForm" onsubmit="return false;">
					<div class="modal-header">						
						<h4 class="modal-title">글 수정</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>제목</label>
							<input type="hidden" name="ID">
							<input type="text" class="form-control" name="TITLE" required>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="10" name="NOTE" required></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" value="닫기" onclick="modiClose()">
						<input type="button" class="btn btn-info" value="저장" onclick="modiOk()">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form onsubmit="return false;">
					<div class="modal-header">						
						<h4 class="modal-title">글 삭제</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<p>정말 이 글을 지우실 겁니까 ?</p>
						<p class="text-warning"><small>돌이킬 수 없습니다..</small></p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" value="닫기" onclick="delClose()">
						<input type="button" class="btn btn-danger" value="삭제" onclick="delOk()">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="viewEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form name="viewForm" onsubmit="return false;">
					<div class="modal-header">						
						<h4 class="modal-title">상세보기</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
							<label>제목</label>
							<b id="TITLE"></b>
						</div>
						<div class="form-group">
							<label>내용</label>
							<pre id="NOTE">
							</pre>
<!-- 							<textarea class="form-control" rows="10" name="NOTE" required></textarea> -->
						</div>
						<div class="form-group">
							<label>작성자</label>
							<b id="REG_ID"></b>
						</div>
						<div class="form-group">
							<label>작성일</label>
							<b id="REG_DT"></b>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="닫기">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>                                		                            