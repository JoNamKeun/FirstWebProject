
	$(".pagging-btn-search").click(function(){
		let keyword = ($(".keyword").val()).trim(); //양쪽 공백 제거
		
		/*검색어창이 비어있는 상태로 이벤트 발생되었을 때, 함수를 리턴시켜 아무일도 벌어지지 않게 한다. */
	if(keyword.replaceAll(" ","") == "")	return;
		 else
			location.href = "boardSearch.do?keyword="+keyword;	
	});
	
	$(".pagging-btn-write").click(function(){
		location.href="boardWriteView.do";
	});





/* ajax 로 검색결과 페이징처리 도전했으나 실패한 코드
$("select").change(function() {

			let data = "kind="+$(this).val();
			
			if($(this).val()=="a"){
				alert("All을 선택");
				location.href = ".content3"
				return;
			} else{
		
			$.ajax({
				type: "get",
				url: "/kindList",
				data: data,
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				success: function(res){
					
					
						let table="";
						for(let i=0; i < res.length; i++){
							table+="<tr>";
							table+="<td>"+res[i].bno+"</td>";
							table+="<td><a href='boardView.do'>"+res[i].title+"</a></td>";
							table+="<td>"+res[i].m_name+"</td>";
							table+="<td>"+res[i].regist_day+"</td>";
							table+="<td>"+res[i].b_count+"</td>";
							table+="<td>"+res[i].b_kind+"</td>";
							table+="</tr>";
						}
						$("tbody").html(table);
						
						//pagging 영역
	
				}, 
				error: function(){
					alert("ajax 통신 실패!!");
				}
				
			});
			}
		});
	*/	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	