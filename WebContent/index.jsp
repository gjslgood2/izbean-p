<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>INHA INP 병헌 ㅎㅎ</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
    body {
        color: #566787;
		background: #f5f5f5;
		font-family: 'Varela Round', sans-serif;
		font-size: 13px;
	}
	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
        margin: 30px 0;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
	.table-title {        
		padding-bottom: 15px;
		background: #435d7d;
		color: #fff;
		padding: 16px 30px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.table-title .btn-group {
		float: right;
	}
	.table-title .btn {
		color: #fff;
		float: right;
		font-size: 13px;
		border: none;
		min-width: 50px;
		border-radius: 2px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 60px;
	}
	table.table tr th:last-child {
		width: 100px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td:last-child i {
		opacity: 0.9;
		font-size: 22px;
        margin: 0 5px;
    }
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
		outline: none !important;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.edit {
        color: #FFC107;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
    .pagination {
        float: right;
        margin: 0 0 5px;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
	.pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }    
	/* Custom checkbox */
	.custom-checkbox {
		position: relative;
	}
	.custom-checkbox input[type="checkbox"] {    
		opacity: 0;
		position: absolute;
		margin: 5px 0 0 3px;
		z-index: 9;
	}
	.custom-checkbox label:before{
		width: 18px;
		height: 18px;
	}
	.custom-checkbox label:before {
		content: '';
		margin-right: 10px;
		display: inline-block;
		vertical-align: text-top;
		background: white;
		border: 1px solid #bbb;
		border-radius: 2px;
		box-sizing: border-box;
		z-index: 2;
	}
	.custom-checkbox input[type="checkbox"]:checked + label:after {
		content: '';
		position: absolute;
		left: 6px;
		top: 3px;
		width: 6px;
		height: 11px;
		border: solid #000;
		border-width: 0 3px 3px 0;
		transform: inherit;
		z-index: 3;
		transform: rotateZ(45deg);
	}
	.custom-checkbox input[type="checkbox"]:checked + label:before {
		border-color: #03A9F4;
		background: #03A9F4;
	}
	.custom-checkbox input[type="checkbox"]:checked + label:after {
		border-color: #fff;
	}
	.custom-checkbox input[type="checkbox"]:disabled + label:before {
		color: #b8b8b8;
		cursor: auto;
		box-shadow: none;
		background: #ddd;
	}
	/* Modal styles */
	.modal .modal-dialog {
		max-width: 400px;
	}
	.modal .modal-header, .modal .modal-body, .modal .modal-footer {
		padding: 20px 30px;
	}
	.modal .modal-content {
		border-radius: 3px;
	}
	.modal .modal-footer {
		background: #ecf0f1;
		border-radius: 0 0 3px 3px;
	}
    .modal .modal-title {
        display: inline-block;
    }
	.modal .form-control {
		border-radius: 2px;
		box-shadow: none;
		border-color: #dddddd;
	}
	.modal textarea.form-control {
		resize: vertical;
	}
	.modal .btn {
		border-radius: 2px;
		min-width: 100px;
	}	
	.modal form label {
		font-weight: normal;
	}	
</style>
<script type="text/javascript">
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	
	selectList();
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


function add() {
	 $.ajax({
	        type:"POST",
	        url:"/INPProject/insert.bh",
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        data: $(document.addedForm).serialize(),
	        datatype:"json",
	        success: function(data) {
	          alert(data.msg);			
	          $(document.addedForm)[0].reset();
	          $('#addEmployeeModal').modal('hide');
	          selectList();
	        },
	        error: function(e, e2, e3) {
	          alert("에러발생");
	        }			
	      });
}

function selectList() {
	$.ajax({
        type:"POST",
        url:"/INPProject/select.bh",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
//         data: $(document.addedForm).serialize(),
        datatype:"json",
        success: function(data) {
        	tableCreate(data)
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
	        url:"/INPProject/delete.bh",
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        datatype:"json",
	        success: function(result) {
	        	alert(result.msg);
	        	$('#deleteEmployeeModal').modal('hide');
	        	selectList();
	        }
	      });
	} else {
		$.ajax({
	        type:"POST",
	        data : {"ID" : delId },
	        url:"/INPProject/delete.bh",
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        datatype:"json",
	        success: function(result) {
	        	alert(result.msg);
	        	$('#deleteEmployeeModal').modal('hide');
	        	selectList();
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
        url:"/INPProject/detail.bh",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        datatype:"json",
        success: function(result) {
        	for ( key in result ) {
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
        url:"/INPProject/detail.bh",
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
        url:"/INPProject/update.bh",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        datatype:"json",
        success: function(result) {
        	alert(result.msg);
        	$('#editEmployeeModal').modal('hide');
        	selectList();
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
						<h2>병헌이의 비밀 다이어링~♥</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>글 작성</span></a>
						<a href="#deleteEmployeeModal" onclick="delOk('A')" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>글 삭제</span></a>						
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
						<input type="button" class="btn btn-success" value="추가" onclick="add()">
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