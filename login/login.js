/**
 * 
 */
$(document).ready(function(){
	
	$("#Scholarship_Status").click(function(){
		$.ajax({
			type:"GET",
			url:"login.jsp?type=1",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				alert("통신데이터 값 :"+data);
				
			}
		})
	})
})