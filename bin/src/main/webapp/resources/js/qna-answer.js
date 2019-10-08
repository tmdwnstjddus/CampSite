var searchOptionForQuestion = 'all';
var searchValueForQuestion = '';
var completedForQuestionList = 'all';

function getQuestionList(page) {
	
	var contextPath = $("#contextPath").val();
	
	$.ajax({
		type: "get",
		url: contextPath + "/qna/getQuestionList?page=" + 
							page + "&searchOption=" + searchOptionForQuestion + 
							"&searchValue=" + searchValueForQuestion + 
							"&completed=" + completedForQuestionList,
		cache: false,
		dataType: "json",
		success: function(resp) {
			var questionList = resp.questions;
			var pagination = resp.pagination;
			renderQuestionList(questionList);
			renderPagination("#paginationForQuestionList", "getQuestionList", pagination);
		}
		
	});
	
}


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
		content += 			new Date(questionList[i].regDate).toLocaleDateString();
		content += 		'</td>';
		
		content +=		'<td>';
		
		if (questionList[i].completed) {
			content += 			'<span class="badge badge-success">';
			content +=				'답변완료';
			content +=			'</span>';
		}else {
			content += '<span class="badge badge-danger">';
			
			content += 		'미처리<a data-toggle="modal" href="javascript:showAnswerModal(';
			content += 			'&#39;' + questionList[i].qaNo + '&#39;&#44; ';
			content += 			'&#39;' + questionList[i].memberId + '&#39;&#44; ';
			content += 			'&#39;' + questionList[i].title + '&#39;&#44; ';
			content += 			'&#39;' + new Date(questionList[i].regDate).toLocaleDateString() + '&#39;&#44; ';
			content += 			'&#39;' + questionList[i].qnaContent + '&#39;';
			content += 			')"><i class="fa fa-pencil"></i></a>';
			content += '</span>';	
		}		
		content += 		'</td>';		
		content += '</tr>';

		
	}
	
	$("#questionListArray").html(content);
	
}

function showAnswerModal(qaNo, memberId, title, qnaDate, qnaContent) {
	$("#answerModal #qaNo").text(qaNo);
	$("#answerModal #memberId").text(memberId);
	$("#answerModal #title").text(title);
	$("#answerModal #qnaDate").text(qnaDate);
	$("#answerModal #qnaContent").html(qnaContent);
	$("#answerModal").modal("show");
}
	    
//--------------------------------------------///
	    
	    var searchValueForQuestion = '';
	    var completedForQuestionList = 'all';
	    
	    function getQuestionList(page) {
	    	
	    	var contextPath = $("#contextPath").val();
	    	
	    	$.ajax({
	    		type: "get",
	    		url: contextPath + "/admin/getQuestionList?page=" + 
	    							page + 
	    							"&searchValue=" + searchValueForQuestion + 
	    							"&completed=" + completedForQuestionList,
	    		cache: false,
	    		dataType: "json",
	    		success: function(resp) {
	    			var questionList = resp.questions;
	    			var pagination = resp.pagination;
	    			renderQuestionList(questionList);
	    			renderPagination("#paginationForQuestionList", "getQuestionList", pagination);
	    		}
	    		
	    	});
	    	
	    }
	    
	    
	    
