$(document).ready(function(e){
	
	getQuestionList(1);

});

//var searchOptionForQuestion = 'all';
//var searchValueForQuestion = '';
var completedForQuestionList = 'all';

function getQuestionList() {
	
	
	$.ajax({
		type: "get",
		//url: "/qna/getQuestionList?completed="+ completedForQuestionList,
		url: "/qna/getQuestionList",
		cache: false,
		dataType: "json",
		success: function(resp) {
			var questionList = resp.questions;
			renderQuestionList(questionList);
		}
		
	});
	
}

$("#searchButtonForQuestionList").on("click", function(e){
	e.preventDefault();
	completedForQuestionList = $("#completedForQuestionList").val();
	getQuestionList(1);
});


////==========================================///
function renderQuestionList(questionList) {
	
	var content = "";
	
	for (var i = 0; i < questionList.length; i++) {
		
		
		content += '<tr>';
		content +=		'<td>';
		content += 			questionList[i].qaNo;
		content += 		'</td>';
		
		content +=		'<td>';
		content += 			questionList[i].title;
		content += 		'</td>';

		content +=		'<td>';
		content += 			questionList[i].memberId
		content += 		'</td>';
		
		content +=		'<td>';
		content += 			new Date(questionList[i].regDate).toLocaleDateString();
		content += 		'</td>';
		
		content +=		'<td>';
		
		if (questionList[i].completed) {			
			content += '<span class="badge badge-success">';
			
			content += 		'<button class="s-text14" data-toggle="modal" data-target="#answerCompletedModal" onclick="showAnswerCompletedModal(';
			content += 			'&#39;' + questionList[i].qaNo + '&#39;&#44; ';
			content += 			'&#39;' + questionList[i].memberId + '&#39;&#44; ';
			content += 			'&#39;' + questionList[i].title + '&#39;&#44; ';
			content += 			'&#39;' + new Date(questionList[i].regDate).toLocaleDateString() + '&#39;&#44; ';
			content += 			'&#39;' + questionList[i].content + '&#39;&#44;';
			content += 			'&#39;' + questionList[i].qnaCommentList[0].comment + '&#39;';
			content += 			');">답변완료 <i class="fa fa-pencil"></i></button>';
			
			content += '</span>';	
			
		}else {
			content += '<span class="badge badge-danger">';
			
			content += 		'<button class="s-text14" data-toggle="modal" data-target="#answerModal" onclick="showAnswerModal(';
			content += 			'&#39;' + questionList[i].qaNo + '&#39;&#44; ';
			content += 			'&#39;' + questionList[i].memberId + '&#39;&#44; ';
			content += 			'&#39;' + questionList[i].title + '&#39;&#44; ';
			content += 			'&#39;' + new Date(questionList[i].regDate).toLocaleDateString() + '&#39;&#44; ';
			content += 			'&#39;' + questionList[i].content + '&#39;';
			content += 			');">미처리 <i class="fa fa-pencil"></i></button>';
			content += '</span>';	
		}		
		content += 		'</td>';		
		content += '</tr>';

		
	}
	
	$("#questionListArray").html(content);
	
}

function showAnswerModal(qaNo, memberId, title, qnaDate, content) {
	$("#answerModal #qaNo").text(qaNo);
	$("#answerModal #memberId").text(memberId);
	$("#answerModal #title").text(title);
	$("#answerModal #qnaDate").text(qnaDate);
	$("#answerModal #qnaContent").html(content);
	$("#answerModal").modal("show");
}


function showAnswerCompletedModal(qaNo, memberId, title, qnaDate, content, answerText) {
	$("#answerCompletedModal #c-qaNo").text(qaNo);
	$("#answerCompletedModal #c-memberId").text(memberId);
	$("#answerCompletedModal #c-title").text(title);
	$("#answerCompletedModal #c-qnaDate").text(qnaDate);
	$("#answerCompletedModal #c-qnaContent").html(content);
	$("#answerCompletedModal #c-answerText").html(answerText);
	$("#answerCompletedModal").modal("show");
}

//--------------------------------------------///
	    

$("#answerSubmitButton").on("click", function(e){
	e.preventDefault();
	submitAnswer();
});


function submitAnswer() {
	
	var qaNo = $("#answerModal #qaNo").text();
	var text = $("#answerModal #answerText").val();
	
	
	var sendData = {
			"qaNo": qaNo,
			"answerText": text
	}
	
	$.ajax({
		type: "POST",
		url: "/qna/admin-answer",
		data: sendData,
		success: function(resp) {
			if (resp === 'success'){
				alert("답변 완료");
				$("#answerModal").modal('hide');
				getQuestionList(1);
			} else {
				alert("실패...");
			}
		},
		error: function(err) {
			console.log(err);
		}
	});
	
}

$("#answerDeleteButton").on("click", function (e){
	e.preventDefault();
	deleteAnswer();
});

function deleteAnswer() {
		
	var qaNo = $("#answerCompletedModal #c-qaNo").text();
	
	$.ajax({
		type: "GET",
		url: "/qna/delete-answer",
		data: { "qaNo": qaNo },
		success: function(resp) {
			if (resp === 'success'){
				alert("답변 삭제");
				// 모달을 닫고
				$("#answerCompletedModal").modal("hide");
				// 질문과 답변 refresh.
				getQuestionList(1);
			} else {
				alert("실패...");
			}
		},
		error: function(err) {
			console.log(err);
		}
	});
	
}








//===========================================================//

//$('#comment-data-container').on('click', '.delete-answer-btn', function(event){
//	
//	var qaNo = $(this).attr('data-qano');
//    
//    $.ajax({
//	    url: "/qna/delete-answer",
//	    method:"GET",
//	    data: { "qaNo": qaNo },
//	    success: function(data, status, xhr) {
//			if(data == 'success') {
//				$("#comment-data-container").load('/qna/qna-answer?qaNo=' + ${ qna.qaNo });
//				alert('답변을 삭제했습니다');					
//				} else {
//					alert('삭제실패');
//					}
//
//			},
//			error: function(xhr, status, err) {
//				alert('삭제실패');
//				}
//	    });
//
//    });
//

	    
	    
	    
